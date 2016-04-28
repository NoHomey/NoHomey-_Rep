#include <iostream>
#include <fstream>
#include <string>
#include "DB.hh"
#include "Table.hh"
#include "Pattern.hh"
#include "Type.hh"

#include "hardcoded.hh"

bool Table::upper = false;
bool DB::upper = false;

int main(void) {
	DB db("exam");

	Table article("Article_1");
	article.field("name", varchar_(),name_);
	article.field("published_on", date_(), published_on_);
	article.field("created_on", date_(), created_on_);

	Table category("Category");
	category.field("date_created_on", date_(), date_created_on_);
	category.field("description", long_text_(), description_);

	Table user("User");
	user.field("age", integer_(), age_);
	user.field("income", float_(), income_);
	user.field("name", varchar_(),name_);

	Table tag("Tag");
	tag.field("hash", varchar_16_(), hash_);
	tag.field("description", varchar_(), description_);

	db.many_to_one(&category, &tag);
	db.one_to_one(&tag, &user);
//	Table category_article;
	db.many_to_one(&user, &article);



	db.add_if_missing(&article);
	db.add_if_missing(&category);
	db.add_if_missing(&user);
	db.add_if_missing(&tag);

	std::ofstream creates("creates.sql", std::ios::out);
	creates << db.create();

	std::ofstream inserts("inserts.sql", std::ios::out);
	inserts << db.use() << db.insert(6);

	std::ofstream selects1("selects1.sql", std::ios::out);
	selects1 << db.use();
	selects1 << db.select(&user, &category, JoinType::inner, 3);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Tag_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("description"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &tag, std::string("Tag_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&article, &tag, JoinType::inner, 2);

	return 0;
}

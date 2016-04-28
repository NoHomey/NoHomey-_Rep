#include <iostream>
#include <fstream>
#include <string>
#include "DB.hh"
#include "Table.hh"
#include "Pattern.hh"
#include "Type.hh"

#include "hardcoded.hh" //192.168.113.98

bool Table::upper = false;
bool DB::upper = false;

int main(void) {
	DB db("exam");

	Table article("Article_1");
	article.field("visible", boolean_(), visible_);
	article.field("published_on", date_(), published_on_);
	article.field("password", string_(), password_);

	Table category("Category");
	category.field("name", varchar_(), name_);
	category.field("description", long_text_(), description_);

	Table user("User");
	user.field("income", float_(), income_);
	user.field("password", varchar_(), password_);
	user.field("created_on", varchar_6_(), gender_);

	Table tag("Tag");
	tag.field("name", varchar_(), name_);
	tag.field("description", varchar_(), description_);

	db.one_to_many(&user, &tag);

	db.many_to_one(&tag, &category);

	Table category_article;
	db.many_to_many(&category, &article, &category_article);

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
	selects1 << db.select(&category, &user, JoinType::inner, 1);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Tag_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("name"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &tag, std::string("Tag_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&article, &tag, JoinType::inner, 5);

	return 0;
}

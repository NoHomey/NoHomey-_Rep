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
	article.field("contenr", long_string_(), content_);
	article.field("published_on", date_(), published_on_);
	article.field("url", string_(), url_);

	Table category("Category");
	category.field("date_created_on", date_(), date_created_on_);
	category.field("description", long_text_(), description_);

	Table user("User");
	user.field("name", varchar_(),name_);
	user.field("description", long_text_(), description_);
	user.field("twitter", varchar_(),twitter_);

	Table tag("Tag");
	tag.field("description", varchar_(), description_);
	tag.field("second_priority", float_(), second_priority_);


	db.one_to_many(&article, &user);
	db.one_to_one(&user, &category);
	Table category_tag;
	db.many_to_many(&category, &tag, &category_tag);


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
	selects1 << db.select(&category, &article, JoinType::inner, 3);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("User_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("twitter"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &user, std::string("User_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&tag, &user, JoinType::inner, 2);

	return 0;
}

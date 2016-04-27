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
	article.field("created_on", date_(), created_on_);
	article.field("published_on", date_(), published_on_);
	article.field("name", varchar_(), name_);

	Table category("Category");
	category.field("created_by", string_(), created_by_);
	category.field("description", long_text_(), description_);

	Table user("User");
	user.field("description", long_text_(), description_);
	user.field("created_on", date_(), created_on_);
	user.field("twitter", varchar_(), twitter_);

	Table tag("Tag");
	tag.field("second_priority", float_(), second_priority_);
	tag.field("description", varchar_(), description_);

	Table tag_user;
	db.many_to_many(&tag, &user, &tag_user);
	Table user_category;
	db.many_to_many(&user, &category, &user_category);
	db.one_to_one(&category, &article);

	db.add_if_missing(&article);
	db.add_if_missing(&category);
	db.add_if_missing(&user);
	db.add_if_missing(&tag);

	std::ofstream creates("creates.sql", std::ios::out);
	creates << db.create();

	std::ofstream inserts("inserts.sql", std::ios::out);
	inserts << db.use() << db.insert(7);

	std::ofstream selects1("selects1.sql", std::ios::out);
	selects1 << db.use() << db.select(&category, &tag, JoinType::inner, 3);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("User_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("twitter"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &user, std::string("User_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use() << db.select(&article, &user, JoinType::inner, 2);

	return 0;
}

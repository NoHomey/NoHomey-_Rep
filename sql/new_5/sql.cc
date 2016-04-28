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
	article.field("name", varchar_(),name_);
	article.field("url", string_(),url_);
	article.field("visible", boolean_(), visible_);

	Table category("Category");
	category.field("description", long_text_(), description_);
	category.field("date_created_on", date_(), created_on_);

	Table user("User");
	user.field("name", varchar_(),name_);
	user.field("age", integer_(), age_);
	user.field("gender", varchar_6_(), gender_);

	Table tag("Tag");
	tag.field("priority_int", int_(), priority_int_);
	tag.field("second_priority", float_(), second_priority_);

	db.many_to_one(&article, &tag);
	Table tag_category;
	db.many_to_many(&tag, &category, &tag_category);
	Table category_user;
	db.many_to_many(&category, &user, &category_user);

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
	selects1 << db.select(&category, &article, JoinType::inner, 1);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Tag_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("second_priority"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &tag, std::string("Tag_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&user, &tag, JoinType::inner, 5);

	return 0;
}

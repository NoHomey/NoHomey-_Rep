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

	Table article("Article_18");
	article.field("name", varchar_(), name_);
	article.field("visible", boolean_(), visible_);
	article.field("price", currency_(), price_);

	Table category("Category");
	category.field("description", long_text_(), description_);
	category.field("date_created_on", date_(), date_created_on_);

	Table user("User");
	user.field("picture_url", string_(), picture_url_);
	user.field("income", float_(), income_);
	user.field("age", int_(), age_);

	Table tag("Tag");
	tag.field("second_priority", float_(), second_priority_);
	tag.field("name", varchar_(), name_);

	db.one_to_one(&article, &category);

	db.many_to_one(&category, &tag);

	Table tag_user;
	db.many_to_many(&tag, &user, &tag_user);

	db.add_if_missing(&article);
	db.add_if_missing(&category);
	db.add_if_missing(&user);
	db.add_if_missing(&tag);

	std::ofstream creates("creates.sql", std::ios::out);
	creates << db.create();

	std::ofstream inserts("inserts.sql", std::ios::out);
	inserts << db.use() << db.insert(10);

	std::ofstream selects1("selects1.sql", std::ios::out);
	selects1 << db.use();
	selects1 << db.select(&tag, &article, JoinType::inner, 2);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Category_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("date_created_on"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &category, std::string("Category_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&user, &category, JoinType::inner, 7);

	return 0;
}

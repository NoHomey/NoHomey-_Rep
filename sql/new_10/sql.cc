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
	article.field("published_on", date_(), published_on_);
	article.field("created_on", date_(), created_on_);
	article.field("password", string_(), password_);

	Table category("Category");
	category.field("priority_double", double_(), priority_double_);
	category.field("created_by", string_(), created_by_);

	Table user("User");
	user.field("gender", varchar_6_(), gender_);
	user.field("twitter", varchar_(), twitter_);
	user.field("age", integer_(), age_);

	Table tag("Tag");
	tag.field("priority_int", int_(), priority_int_);
	tag.field("description", varchar_(), description_);


	Table article_user;
	db.many_to_many(&article, &user, &article_user);
	db.many_to_one(&user, &category);
	db.one_to_one(&category, &tag);


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
	fields.push_back(std::string("age"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &user, std::string("User_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use();
	selects2 << db.select(&tag, &user, JoinType::inner, 2);

	return 0;
}

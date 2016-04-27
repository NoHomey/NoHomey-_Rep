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
	article.field("url", string_(),url_);
	article.field("password", string_(), password_);
	article.field("content", long_string_(), content_);

	Table category("Category");
	category.field("priority", double_(), priority_double_);
	category.field("description", long_text_(), description_);

	Table user("User");
	user.field("income", float_(), income_);
	user.field("description", long_text_(), description_);
	user.field("twitter",varchar_(),twitter_);

	Table tag("Tag");
	tag.field("hash", varchar_16_(), hash_);
	tag.field("description", varchar_(), description_);

	Table user_article;
	db.many_to_many(&user, &article, &user_article);
	db.one_to_many(&article, &category);
	db.one_to_many(&category, &tag);

	db.add_if_missing(&article);
	db.add_if_missing(&category);
	db.add_if_missing(&user);
	db.add_if_missing(&tag);

	std::ofstream creates("creates.sql", std::ios::out);
	creates << db.create();

	std::ofstream inserts("inserts.sql", std::ios::out);
	inserts << db.use() << db.insert(7);

	std::ofstream selects1("selects1.sql", std::ios::out);
	selects1 << db.use() << db.select(&category, &user, JoinType::inner, 3);

	std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Article_1_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("url"));
	migrates << db.use();
	migrates << db.migrate(&migrate, fields, &article, std::string("Article_1_part2"));

	std::ofstream selects2("selects2.sql", std::ios::out);
	selects2 << db.use() << db.select(&tag, &article, JoinType::inner, 2);

	return 0;
}

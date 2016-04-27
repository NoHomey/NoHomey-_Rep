	//Малки главни букви
	bool Table::upper = false;
	bool DB::upper = false;
	
    std::string myfield(unsigned int i) {
        return std::to_string(i + 2);
    }

    Table article("Article_1");
    article.field("myfield", std::string("smallint"), myfield); // => permutaciq [3..12]

    Table article("Article_1");
    article.field("myfield", std::string("smallint"), myfield, false; // => ([1..10]) -> [3..12]
  
  //Миграция на повечве от 1 колона
  std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Category_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("description"));
	fields.push_back(std::string("name"));
	migrates << db.use() << db.migrate(&migrate, fields, &category, std::string("Category_part2"));

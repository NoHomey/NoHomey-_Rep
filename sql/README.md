	//Малки главни букви
	bool Table::upper = false;
	bool DB::upper = false;
  
  //Миграция на повечве от 1 колона
  std::ofstream migrates("migrates.sql", std::ios::out);
	Table migrate("Category_part1");
	std::vector<std::string> fields;
	fields.push_back(std::string("description"));
	fields.push_back(std::string("name"));
	migrates << db.use() << db.migrate(&migrate, fields, &category, std::string("Category_part2"));

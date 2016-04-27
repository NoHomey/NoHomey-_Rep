use exam;

insert into Category (name, created_by) values
	("Liam South", "Liam South"),
	("Liam South", "Liam South"),
	("Liam South", "Liam South"),
	("Liam South", "Liam South"),
	("Liam South", "Liam South"),
	("Liam South", "Liam South"),
	("Liam South", "Liam South");

insert into Tag (hash, name) values
	("9568243231907", "Liam South"),
	("9568243231902", "Liam South"),
	("9568243231903", "Liam South"),
	("9568243231904", "Liam South"),
	("9568243231905", "Liam South"),
	("9568243231901", "Liam South"),
	("9568243231906", "Liam South");

insert into User (income, gender, name, Category_id, Tag_id) values
	(5.5, "female", "Liam South", 2, 7),
	(2.2, "male", "Liam South", 4, 3),
	(4.4, "female", "Liam South", 5, 4),
	(7.7, "male", "Liam South", 3, 5),
	(1.1, "female", "Liam South", 1, 6),
	(6.6, "male", "Liam South", 6, 1),
	(3.3, "female", "Liam South", 7, 2);

insert into Article_15 (price, url, created_on) values
	(3.99, "https://github.com/thebravoman/elsys-db-practices/pull/4", "2016-04-05"),
	(4.99, "https://github.com/thebravoman/elsys-db-practices/pull/7", "2016-04-01"),
	(1.99, "https://github.com/thebravoman/elsys-db-practices/pull/2", "2016-04-07"),
	(6.99, "https://github.com/thebravoman/elsys-db-practices/pull/6", "2016-04-06"),
	(2.99, "https://github.com/thebravoman/elsys-db-practices/pull/1", "2016-04-03"),
	(7.99, "https://github.com/thebravoman/elsys-db-practices/pull/3", "2016-04-02"),
	(5.99, "https://github.com/thebravoman/elsys-db-practices/pull/5", "2016-04-04");

insert into Article_15_Tag (Tag_id, Article_15_id) values
	(2, 6),
	(7, 2),
	(1, 7),
	(5, 1),
	(6, 4),
	(4, 3),
	(3, 5);

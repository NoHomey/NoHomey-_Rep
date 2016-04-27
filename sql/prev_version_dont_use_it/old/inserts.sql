use exam;

insert into Category (name, date_created_on) values
	("Liam South", "2016-04-04"),
	("Liam South", "2016-04-05"),
	("Liam South", "2016-04-03"),
	("Liam South", "2016-04-01"),
	("Liam South", "2016-04-06"),
	("Liam South", "2016-04-02");

insert into Tag (hash, name, Category_id) values
	("9568243231905", "Liam South", 5),
	("9568243231906", "Liam South", 6),
	("9568243231904", "Liam South", 2),
	("9568243231903", "Liam South", 1),
	("9568243231901", "Liam South", 3),
	("9568243231902", "Liam South", 4);

insert into Article_16 (price, url, password, Tag_id) values
	(2.99, "https://github.com/thebravoman/elsys-db-practices/pull/3", "qweqwe1232", 1),
	(4.99, "https://github.com/thebravoman/elsys-db-practices/pull/1", "qweqwe1233", 5),
	(3.99, "https://github.com/thebravoman/elsys-db-practices/pull/5", "qweqwe1236", 2),
	(5.99, "https://github.com/thebravoman/elsys-db-practices/pull/6", "qweqwe1231", 4),
	(1.99, "https://github.com/thebravoman/elsys-db-practices/pull/4", "qweqwe1234", 3),
	(6.99, "https://github.com/thebravoman/elsys-db-practices/pull/2", "qweqwe1235", 6);

insert into User (description, gender, name) values
	("It should have some description at page 6", "female", "Liam South"),
	("It should have some description at page 1", "male", "Liam South"),
	("It should have some description at page 4", "female", "Liam South"),
	("It should have some description at page 2", "male", "Liam South"),
	("It should have some description at page 5", "female", "Liam South"),
	("It should have some description at page 3", "male", "Liam South");

insert into Article_16_User (User_id, Article_16_id) values
	(4, 2),
	(6, 1),
	(5, 5),
	(1, 6),
	(2, 3),
	(3, 4);

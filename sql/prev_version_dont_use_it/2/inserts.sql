use exam;

insert into Category (description, priority) values
	("It should have some description at page 7", 44.44),
	("It should have some description at page 5", 77.77),
	("It should have some description at page 3", 22.22),
	("It should have some description at page 2", 33.33),
	("It should have some description at page 6", 66.66),
	("It should have some description at page 1", 11.11),
	("It should have some description at page 4", 55.55);

insert into Article_15 (password, url, created_on, Category_id) values
	("qweqwe1233", "https://github.com/thebravoman/elsys-db-practices/pull/7", "2016-04-06", 2),
	("qweqwe1235", "https://github.com/thebravoman/elsys-db-practices/pull/5", "2016-04-05", 5),
	("qweqwe1234", "https://github.com/thebravoman/elsys-db-practices/pull/4", "2016-04-03", 1),
	("qweqwe1231", "https://github.com/thebravoman/elsys-db-practices/pull/6", "2016-04-07", 7),
	("qweqwe1232", "https://github.com/thebravoman/elsys-db-practices/pull/2", "2016-04-04", 4),
	("qweqwe1236", "https://github.com/thebravoman/elsys-db-practices/pull/1", "2016-04-01", 6),
	("qweqwe1237", "https://github.com/thebravoman/elsys-db-practices/pull/3", "2016-04-02", 3);

insert into User (password, twitter, name, Category_id) values
	("qweqwe1231", "https://twitter.com/iansomerhalder/status/71606611330667317", "Liam South", 3),
	("qweqwe1237", "https://twitter.com/iansomerhalder/status/71606611330667314", "Liam South", 5),
	("qweqwe1235", "https://twitter.com/iansomerhalder/status/71606611330667316", "Liam South", 4),
	("qweqwe1233", "https://twitter.com/iansomerhalder/status/71606611330667312", "Liam South", 6),
	("qweqwe1232", "https://twitter.com/iansomerhalder/status/71606611330667311", "Liam South", 2),
	("qweqwe1236", "https://twitter.com/iansomerhalder/status/71606611330667315", "Liam South", 7),
	("qweqwe1234", "https://twitter.com/iansomerhalder/status/71606611330667313", "Liam South", 1);

insert into Tag (second_priority, priority) values
	(3.3, 66),
	(5.5, 44),
	(6.6, 11),
	(2.2, 22),
	(1.1, 77),
	(7.7, 33),
	(4.4, 55);

insert into Article_15_Tag (Tag_id, Article_15_id) values
	(6, 1),
	(5, 4),
	(2, 3),
	(3, 6),
	(1, 5),
	(7, 7),
	(4, 2);

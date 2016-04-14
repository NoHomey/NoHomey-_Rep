use exam;

insert into User (twitter, name, dexcription) values
	("https://twitter.com/iansomerhalder/status/71606611330667317", "Liam South", "It should have some description at page 3"),
	("https://twitter.com/iansomerhalder/status/71606611330667313", "Liam South", "It should have some description at page 1"),
	("https://twitter.com/iansomerhalder/status/71606611330667312", "Liam South", "It should have some description at page 7"),
	("https://twitter.com/iansomerhalder/status/71606611330667316", "Liam South", "It should have some description at page 6"),
	("https://twitter.com/iansomerhalder/status/71606611330667314", "Liam South", "It should have some description at page 4"),
	("https://twitter.com/iansomerhalder/status/71606611330667315", "Liam South", "It should have some description at page 5"),
	("https://twitter.com/iansomerhalder/status/71606611330667311", "Liam South", "It should have some description at page 2");

insert into Category (name, created_by, User_id) values
	("Liam South", "Liam South", 3),
	("Liam South", "Liam South", 2),
	("Liam South", "Liam South", 6),
	("Liam South", "Liam South", 5),
	("Liam South", "Liam South", 7),
	("Liam South", "Liam South", 1),
	("Liam South", "Liam South", 4);

insert into Article_1 (name, created_on, content, Category_id) values
	("Liam South", "2016-04-01", "It should have some content at page 5", 4),
	("Liam South", "2016-04-02", "It should have some content at page 3", 6),
	("Liam South", "2016-04-05", "It should have some content at page 4", 1),
	("Liam South", "2016-04-04", "It should have some content at page 2", 2),
	("Liam South", "2016-04-07", "It should have some content at page 7", 3),
	("Liam South", "2016-04-06", "It should have some content at page 6", 5),
	("Liam South", "2016-04-03", "It should have some content at page 1", 7);

insert into Tag (priority, hash, User_id) values
	(11, "9568243231906", 4),
	(66, "9568243231904", 1),
	(55, "9568243231902", 3),
	(33, "9568243231901", 7),
	(77, "9568243231903", 2),
	(44, "9568243231907", 6),
	(22, "9568243231905", 5);

use exam;

create table User_part1 (
	id int not null primary key auto_increment,
	name varchar(256)
);

insert into User_part1 (name) select name from User;
alter table User drop column name;
alter table User rename User_part2;

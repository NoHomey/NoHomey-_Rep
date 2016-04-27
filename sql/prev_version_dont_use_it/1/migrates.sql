use exam;

create table User_part1 (
	id int not null primary key auto_increment,
	income float(8, 4)
);

insert into User_part1 (income) select income from User;
alter table User drop column income;
alter table User rename User_part2;

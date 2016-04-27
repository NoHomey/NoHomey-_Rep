use exam;

create table Category_part1 (
	id int not null primary key auto_increment,
	description longtext
);

insert into Category_part1 (description) select description from Category;
alter table Category drop column description;
alter table Category rename Category_part2;

use exam;

create table Article_16_part_1 (
	id int not null primary key auto_increment,
	password varchar(256)
);

insert into Article_16_part_1 (password) select password from Article_16;
alter table Article_16 drop column password;
alter table Article_16 rename Article_16_part_2;

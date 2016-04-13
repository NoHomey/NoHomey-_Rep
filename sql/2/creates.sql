drop database if exists exam;
create database exam;
use exam;

create table Category (
	id int not null primary key auto_increment,
	description longtext,
	priority double(16, 8)
);

create table Article_15 (
	id int not null primary key auto_increment,
	password varchar(256),
	url varchar(256),
	created_on date,
	Category_id int not null,
	foreign key (Category_id) references Category (id)
);

create table User (
	id int not null primary key auto_increment,
	password varchar(256),
	twitter varchar(6),
	name varchar(256),
	Category_id int not null,
	foreign key (Category_id) references Category (id)
);

create table Tag (
	id int not null primary key auto_increment,
	second_priority float(8, 4),
	priority int
);

create table Article_15_Tag (
	id int not null primary key auto_increment,
	Tag_id int not null,
	Article_15_id int not null,
	foreign key (Tag_id) references Tag (id),
	foreign key (Article_15_id) references Article_15 (id)
);

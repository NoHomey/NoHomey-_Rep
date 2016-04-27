drop database if exists exam;
create database exam;
use exam;

create table User (
	id int not null primary key auto_increment,
	twitter varchar(6),
	name varchar(256),
	dexcription longtext
);

create table Category (
	id int not null primary key auto_increment,
	name varchar(256),
	created_by varchar(256),
	User_id int not null,
	foreign key (User_id) references User (id)
);

create table Article_1 (
	id int not null primary key auto_increment,
	name varchar(256),
	created_on date,
	content varchar(1256),
	Category_id int not null,
	foreign key (Category_id) references Category (id)
);

create table Tag (
	id int not null primary key auto_increment,
	priority int,
	hash varchar(16),
	User_id int not null unique,
	foreign key (User_id) references User (id)
);

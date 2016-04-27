drop database if exists exam;
create database exam;
use exam;

create table Category (
	id int not null primary key auto_increment,
	name varchar(256),
	date_created_on date
);

create table Tag (
	id int not null primary key auto_increment,
	hash varchar(16),
	name varchar(256),
	Category_id int not null unique,
	foreign key (Category_id) references Category (id)
);

create table Article_16 (
	id int not null primary key auto_increment,
	price float(5, 2),
	url varchar(256),
	password varchar(256),
	Tag_id int not null,
	foreign key (Tag_id) references Tag (id)
);

create table User (
	id int not null primary key auto_increment,
	description longtext,
	gender varchar(6),
	name varchar(256)
);

create table Article_16_User (
	id int not null primary key auto_increment,
	User_id int not null,
	Article_16_id int not null,
	foreign key (User_id) references User (id),
	foreign key (Article_16_id) references Article_16 (id)
);

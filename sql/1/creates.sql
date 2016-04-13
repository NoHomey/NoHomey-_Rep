drop database if exists exam;
create database exam;
use exam;

create table Category (
	id int not null primary key auto_increment,
	name varchar(256),
	created_by date
);

create table Tag (
	id int not null primary key auto_increment,
	hash varchar(16),
	name varchar(256)
);

create table User (
	id int not null primary key auto_increment,
	income float(8, 4),
	gender varchar(6),
	name varchar(256),
	Category_id int not null,
	Tag_id int not null,
	foreign key (Category_id) references Category (id),
	foreign key (Tag_id) references Tag (id)
);

create table Article_15 (
	id int not null primary key auto_increment,
	price float(5, 2),
	url varchar(256),
	created_on date
);

create table Article_15_Tag (
	id int not null primary key auto_increment,
	Tag_id int not null,
	Article_15_id int not null,
	foreign key (Tag_id) references Tag (id),
	foreign key (Article_15_id) references Article_15 (id)
);

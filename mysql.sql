/*iztri db (ime na bazata dani)*/
drop database if exists db;
/*suzdawane db (ime na bazata dani)*/
create database if not exists db;
/*izpolzvai db (imae na bazata dani)*/
use db;
/*1. create*/
/*suzdava tablica (ime na tablicata)*/
/*dobavqne na pole:pole TYPE(size) [NOT null|null] [default value] [auto_increment]*/
create table if not exists Article_ (
	id integer not null primary key auto_increment,
	password varchar(255),
	price numeric(15,2),
	name varchar(255)
);

create table if not exists Category (
	id integer not null primary key auto_increment,
	priority double(15,2),
	created_by varchar(255)
);

create table if not exists User (
	id integer not null primary key auto_increment,
	income float(15,2),
	created_on date,
	age integer
);

create table if not exists Tag (
	id integer not null primary key auto_increment,
	name varchar(255),
	description varchar(255)
);

/*2. connect*/

/*alter table tablica add kluch TYPE(size)*/
alter table Article_ add user_id integer;
/*alter table tablica add foreign key (kluch) references tablica(pole)*/
alter table Article_ add foreign key (user_id) references User(id); /*User one to many with Article_*/

alter table Tag add category_id integer;
alter table Tag add foreign key (category_id) references Category(id);

/*Article_ many to many Tag (nujna e svurzvashta tablca)*/
create table if not exists Article__Tag (
	article__id integer,
	tag_id integer,
	foreign key (article__id) references Article_(id), /*dobavqne na kluch kum veche sushtestvuvashta tablica*/
	foreign key (tag_id) references Tag(id)
);

/*Y for X*/
/*X one to many Z*/
/*Z many to many Y*/

select Y.id from Y join Z_Y       
on Y.id = Z_Y.y_id join Y       
on Z_Y.z_id = Z.id join X 
on Z.x_id = X.id                           
where X.id = 1;

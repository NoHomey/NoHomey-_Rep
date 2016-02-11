/*creating*/

drop database if exists db;
create database if not exists db;
use db;

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

/*connecting*/

alter table Article_ add user_id integer;
alter table Article_ add foreign key (user_id) references User(id);

alter table Tag add category_id integer;
alter table Tag add foreign key (category_id) references Category(id);

create table if not exists Article__Tag (
	article__id integer,
	tag_id integer,
	foreign key (article__id) references Article_(id),
	foreign key (tag_id) references Tag(id)
);

/*inserting*/

insert into Category (priority, created_by) values(12.23, "name");
insert into Category (priority, created_by) values(12.22, "name1");

insert into User (income, created_on, age) values(12.23, NOW(), 1);
insert into User (income, created_on, age) values(12.22, NOW(), 2);

insert into Article_ (password, price, name, user_id) values("password", 12.23, "name", 1);
insert into Article_ (password, price, name, user_id) values("password1", 12.22, "name1", 2);

insert into Tag (name, description, category_id) values("name", "desk", 1);
insert into Tag (name, description, category_id) values("name2", "desk2", 2);

insert into Article__Tag (tag_id, article__id) values(1, 1);
insert into Article__Tag (tag_id, article__id) values(2, 2);

/*select*/

select Tag.name from Tag join Article__Tag                    /*SELECT User.id FROM User JOIN Tag_User*/
on Tag.id = Article__Tag.tag_id join Article_                 /*ON User.id = Tag_User.user_id JOIN Tag*/
on Article__Tag.article__id = Article_.id join User           /*ON Tag_User.tag_id = Tag.id JOIN Article_43*/
on Article_.user_id = User.id                                 /*ON Tag.article_43_id = Article_43.id*/
where User.id = 1;                                            /*WHERE Article_43.id = 1;*/


select Y.id from Y join Z_Y       
on Y.id = Z_Y.y_id join Y       
on Z_Y.z_id = Z.id join X 
on Z.x_id = X.id                           
where X.id = 1;  


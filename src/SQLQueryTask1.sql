create database ecommerce;

use ecommerce;

--Creating 4 tables
create table gold_member_users(
	userId varchar(50) primary key,
	signup_date date);

create table users(
	userId varchar(50) primary key,
	signup_date date
	);

create table Products(
	product_name varchar(30) ,
	price int not null,
	product_id int primary key);

create table Sales(
	userId varchar(50),
	created_date date,
	product_id int foreign key references Products(product_id));

--inserting values
insert into gold_member_users(userId, signup_date)
values('John','09-22-2017'), 
	('Mary','04-21-2017');

insert into users(userId, signup_date)
values('John','09-02-2014'), 
	('Michel','01-15-2015'), 
	('Mary','04-11-2014');

insert into Products(product_id, product_name, price)
values(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330);

insert into Sales(userId, created_date, product_id)
values('John','04-19-2017',2), ('Mary','12-18-2019',1), ('Michel','07-20-2020',3), ('John','10-23-2019',2), 
('John','03-19-2018',3), ('Mary','12-20-2016',2), ('John','11-09-2016',1), ('John','05-20-2016',3), 
('Michel','09-24-2017',1), ('John','03-11-2017',2), ('John','03-11-2016',1), ('Mary','11-10-2016',1), 
('Mary','12-07-2017',2);

--Show all the tables 
select * from sys.tables;

--Count all the records in a single query
select (select count(*) from gold_member_users) as gold_member_users_count, 
	(select count(*) from users) as users_count, (select count(*) from Products) as products_count,
	(select count(*) from Sales) as Sales_count;
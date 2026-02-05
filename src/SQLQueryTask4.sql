use ecommerce
go
--Customers names starts with M 
select userID from users
where userID like ('M%');

--Find the Distinct customer Id of each customer 
select distinct userID from users;

--Change Column name from price to price_value
exec sp_rename 'Products.price', 'price_value', 'column';
select * from Products;

--Change the Column value product_name – Ipad to Iphone
update Products set product_name = 'Iphone' where product_name = 'Ipad'
select * from Products;

--Change the table name of gold_member_users to gold_membership_users 
exec sp_rename 'gold_member_users', 'gold_membership_users';
select * from gold_membership_users;
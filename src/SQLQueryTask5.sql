use ecommerce 
go
--Create new column Status, values should be 2, if the user is gold member, then status should be Yes else No.
alter table users add status varchar(5);


update users set status = case
when userid in (select userId from gold_membership_users)
then 'yes' else 'no' 
end;
select * from users;

--Delete users_ids 1,2 from users and roll back one by one
begin transaction;
delete from users where userId = 'John';
select * from users;
delete from users where userId = 'Mary';
select * from users;
rollback;
select * from users;

--Insert one more record as (3,'Laptop',330)
insert into Products(product_id, product_name, price_value)
values(3,'Laptop',330);

insert into Products(product_id, product_name, price_value)
values(4,'Laptop',330),
      (5, 'Laptop',330);

select * from Products;

--query to find the duplicates in products
select product_name, count(*) as total_count
from Products
group by product_name
having count(*) > 1;
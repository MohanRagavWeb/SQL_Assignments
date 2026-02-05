use ecommerce
go

--Create new table and insert values
create table products_sold(sell_date date, products varchar(30));

insert into products_sold(sell_date, products)
values ('2020-05-30', 'Headphones'), 
 ('2020-06-01','Pencil'), 
 ('2020-06-02','Mask'), 
 ('2020-05-30','Basketball'), 
 ('2020-06-01','Book'), 
 ('2020-06-02', ' Mask '), 
 ('2020-05-30','T-Shirt');

--query to find number of different products sold for each date and their names
select sell_date, count(products) as number,
STRING_AGG(products,',') as sold_list
from products_sold
group by sell_date;
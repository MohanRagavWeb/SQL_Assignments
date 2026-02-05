use ecommerce
go
--Create another new table and insert values
create table sales_data(productid int, sale_date date, quantity_sold int);

insert into sales_data(productid, sale_date, quantity_sold)
values(1, '2022-01-01', 20), 
   	(2, '2022-01-01', 15), 
   	(1, '2022-01-02', 10), 
    (2, '2022-01-02', 25), 
    (1, '2022-01-03', 30), 
    (2, '2022-01-03', 18), 
    (1, '2022-01-04', 12), 
	(2, '2022-01-04', 22);

select * from sales_data;

--Assign rank by partition based on product_id and find the latest product_id sold 
select *,
rank() over (partition by productid order by sale_date desc) as sale_rank
from sales_data;

--Retrieve the quantity_sold value from a previous row and compare the quantity_sold. 
select productid, sale_date, quantity_sold,
lag(quantity_sold) over (partition by productid order by sale_date) as previous_value,
case
when quantity_sold > lag(quantity_sold) over (partition by productid order by sale_date)
	then 'Increased'
when quantity_sold < lag(quantity_sold) over (partition by productid order by sale_date)
	then 'Decreased'
else 'No change'
end as comparision
from sales_data;

--Partition based on product_id and return the first and last values in ordered set. 
select productid, sale_date, quantity_sold,
first_value(quantity_sold) over (partition by productid order by sale_date asc) as
first_quantity_sold,
last_value(quantity_sold) over (partition by productid order by sale_date asc rows between unbounded preceding
and unbounded following) as
last_quantity_sold
from sales_data;

 
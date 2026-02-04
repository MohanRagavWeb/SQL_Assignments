use ecommerce

--total amount each customer spent
select s.userId, sum(p.price) as total_spent from Products p
inner join Sales s 
on p.product_id = s.product_id
group by s.userId;

--distinct dates of each customer 
select distinct userId as Customer_name, created_date as visit_date from Sales
order by userId;

--first product purchased by each customer
select u.userId, p.product_id, p.product_name, s.created_date from
(select *, ROW_NUMBER() over(partition by product_id order by created_date)as rn from Sales)s
inner join Products p
on s.product_id = p.product_id
inner join users u on 
u.userId = s.userId
where rn = 1;
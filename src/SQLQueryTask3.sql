use ecommerce
go

--most purchased item of each customer and count
select t.userId, t.item_count, t.product_name 
from (select u.userId, count(*) as item_count, p.product_name,
rank() over (partition by u.userId order by count(*) desc) as rnk from Sales s
join users u on u.userId = s.userId
join Products p on s.product_id = p.product_id
group by u.userId, p.product_id, p.product_name
)t
where t.rnk = 1;

--customer who is not the gold_member_user
select u.userId from users u where not exists
(select * from gold_member_users gu where u.userId = gu.userId);

--amount spent by each customer when gold_member
select gu.userId, sum(p.price) as total_amount_spent
from gold_member_users gu join Sales s
on gu.userId = s.userId
join Products p on s.product_id = p.product_id
group by gu.userId
order by gu.userId;
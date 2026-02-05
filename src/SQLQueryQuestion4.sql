use ecommerce 
go
 --Create another new table and insert values
 create table email_signup(id int, email_id varchar(30), signup_date date);

 insert into email_signup(id, email_id, signup_date)
 values (1, 'Rajesh@Gmail.com', '2022-02-01'), 
 (2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'), 
 (3, 'Hitest@Gmail.com', '2020-09-08'), 
 (4, 'Salil@Gmmail.com', '2019-07-05'), 
 (5, 'Himanshu@Yahoo.com', '2023-05-09'), 
 (6, 'Hitesh@Twitter.com', '2015-01-01'), 
 (7, 'Rakesh@facebook.com', null); 

 select * from email_signup;
 --query to replace null value with ‘1970-01-01’ 
 update email_signup set signup_date = isnull(signup_date, '1970-01-01');

 --find gmail accounts with latest and first signup date and difference between both the dates
 select 
	 count(*) as count_gmail_account,
	 max(signup_date) as latest_signup_date,
	 min(signup_date)as first_signup_date,
	 DATEDIFF(day, min(signup_date),  max(signup_date)) as diff_in_days
	 from email_signup
	 where email_id like '%gmail.com';

 
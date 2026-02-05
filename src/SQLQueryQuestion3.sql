use ecommerce
go
--Create another new table and insert values
create table dept_tbl(id_deptname varchar(30), emp_name varchar(30), salary int);

insert into dept_tbl(id_deptname, emp_name, salary)
values ('1111-MATH', 'RAHUL', 10000), 
 ('1111-MATH', 'RAKESH', 20000), 
 ('2222-SCIENCE', 'AKASH', 10000), 
 ('222-SCIENCE', 'ANDREW', 10000), 
 ('22-CHEM', 'ANKIT', 25000), 
 ('3333-CHEM', 'SONIKA', 12000), 
 ('4444-BIO', 'HITESH', 2300), 
 ('44-BIO', 'AKSHAY', 10000) 

 --total salary of each department 
 select substring(id_deptname, charindex('-', id_deptname) + 1, len(id_deptname)) as department,
 sum(salary) as total_salary
 from dept_tbl
 group by substring(id_deptname, charindex('-', id_deptname) + 1, len(id_deptname));

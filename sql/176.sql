# Write your MySQL query statement below

select
   coalesce((select DISTINCT  Salary from Employee order by Salary desc limit 1, 1), NULL)  as SecondHighestSalary;
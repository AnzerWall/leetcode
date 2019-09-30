# https://leetcode.com/problems/employees-earning-more-than-their-managers/

# Write your MySQL query statement below
select Name as Employee from (select t1.Name, t1.Salary,t2.Salary as ManagerSalary from Employee as t1 left join Employee as t2 on t1.ManagerId  = t2.Id where t1.Salary > t2.Salary) as tmp
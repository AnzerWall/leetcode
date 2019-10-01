# Write your MySQL query statement below
# 没有窗口函数，我不知道我写了一坨啥
select maxSalaryTable.DName as Department, Employee.Name as Employee, Salary from Employee left join
(select max(Salary) as MaxSalary, Department.Id as DId, Department.Name as DName from Department left join Employee on Employee.DepartmentId=Department.Id group by Department.Id) as maxSalaryTable on maxSalaryTable.DId=Employee.DepartmentId where Employee.Salary=maxSalaryTable.MaxSalary


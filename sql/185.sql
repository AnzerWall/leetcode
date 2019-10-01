# https://leetcode.com/problems/department-top-three-salaries/
# 没有窗口函数就算了，求的rank还是dense_rank


select Department.Name as Department,Tmp.Name as Employee,Tmp.Salary as Salary from
(select IF(@y=D.DepartmentId,IF(@z=D.Salary,@x, @x:=@x+1), @x:=1) as Rank, IF(@y=D.DepartmentId, @y, @y:=D.DepartmentId) as SaveDepartment, IF(@z=D.Salary, @z, @z:=D.Salary) as SaveSalary ,D.Name as Name, D.Salary as Salary, D.DepartmentId as DepartmentId from (select * from Employee order by DepartmentId,Salary desc) as D, (select @x:=0, @y:=NULL, @z:=NULL) as V) as Tmp
left join Department on Tmp.DepartmentId=Department.Id
where Tmp.Rank<=3 and Department.Name is not NULL

# https://leetcode.com/problems/nth-highest-salary/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  declare M int;
  set M = N - 1;
  RETURN (
      # Write your MySQL query statement below.
        IFNULL(
      (select DISTINCT Salary from Employee order by Salary desc limit M,1   ),
    NULL)
  );
END
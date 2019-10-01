# Write your MySQL query statement below
select Name as Customers from Customers left join Orders on Orders.CustomerId = Customers.Id where Orders.CustomerId is Null
# https://leetcode.com/problems/delete-duplicate-emails/
# delete from Person where Id not in (
#    SELECT min(p.Id) FROM (SELECT * FROM Person) as p GROUP BY p.Email HAVING count(p.Id) >= 1
#)
# 以上是沙雕写法
DELETE p1 FROM Person p1, Person p2 WHERE p1.Email = p2.Email AND p1.Id > p2.Id
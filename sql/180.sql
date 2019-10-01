# https://leetcode.com/problems/consecutive-numbers/
select distinct Num as ConsecutiveNums  from(select If(@y=Num, @x:=@x+1, @x:=1) as cnt, If(@y=Num, @y, @y:=Num) as now,Num from Logs,(select @x:=0, @y:=NULL) as v) as tmp where cnt>=3

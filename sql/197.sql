# Write your MySQL query statement below
select w1.Id as Id from Weather w1, Weather w2 where date_sub(w1.RecordDate,interval 1
day)=w2.RecordDate and w1.Temperature>w2.Temperature


#you can do either of these, the second one is faster
#select w1.id
#from weather as w0, weather as w1
#where DATE_ADD(w0.recorddate, interval 1 day) = w1.recorddate and w0.temperature < w1.temperature
#select w1.id
#from weather as w0, weather as w1
#where DATEDIFF(w1.recorddate, w0.recorddate) = 1 and w0.temperature < w1.temperature
# Write your MySQL query statement below
# https://leetcode.com/problems/rank-scores/
select Score,CAST(R as unsigned) as Rank from (
    select Score,IF(@y=SCORE, @x, @x:=IFNULL(@x, 0)+1) as R, IF(@y=SCORE, @y, @y:=SCORE) as LAST_SCORE
    from Scores as t,(SELECT @x:=0, @y:=NULL) as v
    order by Score desc
) as tmp
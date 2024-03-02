# Write your MySQL query statement below

select person_name from
    (select *, sum(weight) over (order by turn) cumulativeSum from queue) x
where cumulativeSum <=1000
order by CumulativeSum desc
limit 0,1
       

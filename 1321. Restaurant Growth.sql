# Write your MySQL query statement below
With dates as 
(
    select distinct visited_on from customer
)

select 
    d.visited_on, 
    SUM(c.amount) as amount, 
    ROUND(SUM(c.amount)/7, 2) as average_amount
from dates d inner join customer c
on DATEDIFF(d.visited_on, c.visited_on) between 0 and 6
where DATEDIFF(d.visited_on, (select MIN(visited_on) from customer)) >= 6
group by d.visited_on
order by d.visited_on
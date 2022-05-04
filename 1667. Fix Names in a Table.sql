# Write your MySQL query statement below
select 
    user_id, 
     INITCAP(name) AS name
from users
order by user_id
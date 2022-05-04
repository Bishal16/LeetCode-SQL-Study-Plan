# Write your MySQL query statement below
select id, id = if(p_id is null,'Root','else') as type
from Tree 
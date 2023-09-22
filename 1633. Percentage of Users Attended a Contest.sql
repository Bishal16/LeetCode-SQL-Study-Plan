# Write your MySQL query statement below
SELECT DISTINCT  contest_id,round(count(*)*100/(select count(*) from users),2) as percentage FROM register
 group by contest_id

 order by  percentage desc, contest_id 

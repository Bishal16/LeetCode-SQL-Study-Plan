# Write your MySQL query statement below
-- select customer_id from
--     (select 
--         customer_id, 
--         count(distinct product_key) cnt 
--     from customer
--     group by customer_id
--     ) x
--     where cnt = (select count(*) from product)



    select customer_id from customer
    group by customer_id 
    having  count(distinct product_key) = (select count(*) from product)
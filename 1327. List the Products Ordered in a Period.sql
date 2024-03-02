# Write your MySQL query statement below
select * from
(
    select p.product_name, sum(unit) unit from
        products p left join orders o
    on 
        p.product_id = o.product_id
    where 
        (o.order_date >= '2020-02-00') 
        and 
        (o.order_date < '2020-03-00')    
    group by
        p.product_id, p.product_name
) t
where unit >= 100
select product_id , new_price price from
(select product_id , new_price ,change_date, dense_rank() over (partition by product_id order by change_date) as rnk
    from products
    where change_date <= '2019-08-16'
order by product_id, change_date)x
where (product_id, rnk) in 
                            (
                            select product_id ,max(rnk) rnk from 
                                (select product_id , new_price ,change_date, dense_rank() over (partition by product_id order by change_date) as rnk
                                    from products
                                    where change_date <= '2019-08-16'
                                order by product_id, change_date)sub
                                GROUP BY product_id
                            )

union all

select product_id, 10 as price from
    (select product_id, min(change_date) md from products 
    group by product_id
    )y
where md > '2019-08-16'
                        
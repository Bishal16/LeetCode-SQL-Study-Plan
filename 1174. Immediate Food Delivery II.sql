# Write your MySQL query statement 
# select 
#     round(sum(case when order_date = cus_pref_date then 1 else 0 end)*100/count(*),2)
#     as immediate_percentage
#  from 
# (
#     select 
#         min(order_date) as order_date, 
#         customer_pref_delivery_date as cus_pref_date 
#     from delivery
#     group by customer_id
# ) table1
Select 
    round(avg(order_date = customer_pref_delivery_date)*100, 2) as immediate_percentage
from Delivery
where (customer_id, order_date) in (
    Select customer_id, min(order_date) 
  from Delivery
  group by customer_id
);
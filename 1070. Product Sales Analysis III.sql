# Write your MySQL query statement below
-- SELECT product_id, min(year) first_year , quantity, price from sales
-- group by product_Id;


SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id
)
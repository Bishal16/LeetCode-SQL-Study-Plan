SELECT t1.catagory category, t2.accounts_count
FROM (
    SELECT catagory, ROW_NUMBER() OVER () AS id
    FROM (
        SELECT 'Low Salary' AS catagory
        UNION ALL
        SELECT 'Average Salary'
        UNION ALL
        SELECT 'High Salary'
    ) x
) t1
LEFT JOIN (
    SELECT Salary AS accounts_count, ROW_NUMBER() OVER () AS id
    FROM (
        SELECT COUNT(income) AS Salary FROM accounts WHERE income < 20000
        UNION ALL
        SELECT COUNT(income) FROM accounts WHERE income BETWEEN 20000 AND 50000
        UNION ALL
        SELECT COUNT(income) FROM accounts WHERE income > 50000
    ) xx
) t2 ON t1.id = t2.id;

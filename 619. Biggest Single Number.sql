select coalesce(
    (select num from 
        (
            select num, count(num) freq from mynumbers
            group by num
            order by num desc
        ) x 
    where freq = 1
    limit 0, 1), null
    ) as num
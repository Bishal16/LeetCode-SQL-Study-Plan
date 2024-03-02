# Write your MySQL query statement below
select distinct num ConsecutiveNums from
(select num, count(*) ConsecutiveNums  from
(
    select *,
        (row_number() over (order by id) -
        row_number() over (partition by num order by id)
        ) as grp
    from logs
)m
group by grp, num)x
where ConsecutiveNums >= 3
order by num

--  select *, row_number() over (order by id) rn, row_number() over (partition by num order by id) rnn,
--         (row_number() over (order by id) -
--         row_number() over (partition by num order by id)
--         ) as grp
--     from logs
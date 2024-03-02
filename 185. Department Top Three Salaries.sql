# Write your MySQL query statement below
select 
    Department, 
    Employee, 
    Salary from
(select 
    Department, 
    Employee, 
    Salary,
    dense_rank() over (partition by Department order by Salary desc) as rnk
    from
        (
            select d.name Department, e.name Employee, e.Salary Salary from
                employee e
                left join
                department d
            on e.departmentId = d.id
        ) combined 
)t
where rnk<=3
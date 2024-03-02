# Write your MySQL query statement below
select x.employee_id, name, reports_count, average_age from
(
    (select 
        reports_to employee_id, 
        count(reports_to) reports_count , 
        round(avg(age),0) average_age 
    from employees
    group by reports_to
    ) x
left join
    employees e

    on x.employee_id = e.employee_id
)
where reports_count >= 1
order by employee_id
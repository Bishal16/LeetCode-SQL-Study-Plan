select name from employee
where id in
    (select managerid from
        (select managerid, count(managerid) cnt from employee
            where managerid is not null 
            group by managerid) x
        where cnt>=5)
    

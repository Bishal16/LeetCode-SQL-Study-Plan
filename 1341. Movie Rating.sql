# Write your MySQL query statement below
select results from
(select name as results from 
    users
left join
    (select user_id, countMovie from
        (select user_id, count(movie_id) countMovie from movierating
        group by user_id)x
    where countMovie = (select count(movie_id) countMovie from movierating group by user_id order by countMovie desc limit 0,1)
    )x
on users.user_id = x.user_id
where x.user_id is not null
order by name 
limit 0,1)a


union all


select title as results from
(select title from
movies
left join

(SELECT movie_id, avgRating 
FROM (
    SELECT movie_id, SUM(rating) / COUNT(movie_id) AS avgRating
    FROM movierating
    WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 02
    GROUP BY movie_id
    HAVING avgRating = (
        SELECT SUM(rating) / COUNT(movie_id) AS subAvgRating
        FROM movierating
        WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 02
        GROUP BY movie_id
        ORDER BY subAvgRating DESC
        LIMIT 0,1
    )
) x
)y
on movies.movie_id = y.movie_id
where avgRating is not null
order by title
limit 0,1
)b




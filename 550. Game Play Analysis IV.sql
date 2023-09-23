# Write your MySQL query statement below
SELECT
    round(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM activity), 2) AS fraction
FROM activity 
WHERE (player_id, date_sub(event_date, interval 1 day)) IN (
    SELECT player_id, MIN(event_date) AS min_event_date
    FROM activity
    GROUP BY player_id
);

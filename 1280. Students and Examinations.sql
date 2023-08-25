# Write your MySQL query statement below

select s.student_id, student_name, sub.subject_name, ifnull(attended_Exams,0) attended_exams from

(students s cross join subjects sub)

left join

(select student_id, subject_name, count(*) attended_exams
from examinations
group by student_id, subject_name) as grp

on s.student_id = grp.student_id and sub.subject_name = grp.subject_name

order by s.student_id, sub.subject_name
--Shows number of lessons in each month of the given year

CREATE VIEW lesson_counts_per_month AS
SELECT DATE_TRUNC('month', date_and_time::timestamp) AS month, COUNT(*) AS num_lessons
FROM public.lesson
WHERE DATE_PART('year', date_and_time::timestamp) = 2023
GROUP BY month
ORDER BY month;



--Show the number of lessons given per month during a specified year.
-- This query is expected to be performed a few times per week.
--It shall be possible to retrieve the total number of lessons per month (just one number per month) 
--and the specific number of individual lessons, group lessons and ensembles (three numbers per month). 

CREATE VIEW lesson_count_month AS
SELECT 
   DATE_TRUNC('month', date_and_time::timestamp) AS month,
    COUNT(*) AS number_lessons,
    COUNT(il.lesson_id) AS number_individual_lessons,
    COUNT(gl.lesson_id) AS number_group_lessons,
    COUNT(e.lesson_id) AS number_ensembles
FROM 
    public.lesson l
    LEFT JOIN public.individual_lesson il ON l.lesson_id = il.lesson_id
    LEFT JOIN public.group_lesson gl ON l.lesson_id = gl.lesson_id
    LEFT JOIN public.ensembles e ON l.lesson_id = e.lesson_id
WHERE 
    DATE_PART('year', l.date_and_time::timestamp) = 2023
GROUP BY 
    month
ORDER BY 
    month;

--Show how many students there are with no sibling, with one sibling, with two siblings

CREATE VIEW count_sibling AS
SELECT 
    COUNT(CASE WHEN sibling_count = 0 THEN 1 ELSE NULL END) AS num_no_sibling,
    COUNT(CASE WHEN sibling_count = 1 THEN 1 ELSE NULL END) AS num_one_sibling,
    COUNT(CASE WHEN sibling_count = 2 THEN 1 ELSE NULL END) AS num_two_siblings
FROM (
    SELECT s.student_id, 
           COUNT(sb.student_id) AS sibling_count
    FROM public.student s
    LEFT JOIN public.sibling sb ON s.student_id = sb.student_id
    GROUP BY s.student_id
) AS sibling_counts;



--Shows insctructors and the number of lessons they give

CREATE VIEW instructor_lessons AS
SELECT instructor_id, COUNT(lesson.lesson_id) AS total_lessons
FROM lesson
INNER JOIN instructor ON lesson.instructor_id = instructor.id
GROUP BY instructor_id
ORDER BY total_lessons DESC;



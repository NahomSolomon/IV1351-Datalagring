--Show the number of lessons given per month during a specified year.
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
-- It is selecting and grouping the data in month, number of lesson and the three types of lessons as well.
--It is taking the date from the table lesson LEFT join with the other types of lessons. Then we narrow down the result to the specified year and grouping them in the respective month. 
--Lastly it will order the result by the month column



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
--It will select and group the data in no_siblings, one_sibling and two_siblings.
--It will take the data from the student, that is student_id and left join with sibling table as well as counting the siblings of each student.
--It is then filtered by number of siblings.


--Shows insctructors and the number of lessons they give
CREATE VIEW instructor_lessons AS
SELECT instructor_id, COUNT(lesson.lesson_id) AS total_lessons
FROM lesson
INNER JOIN instructor ON lesson.instructor_id = instructor.id
GROUP BY instructor_id
ORDER BY total_lessons DESC;
--It will select and group into instructor_id and total number of lessons. 
--It takes the data from the lesson table and Inner joins, matching the instructor_id and the instructor_id column in table lesson. 
--Then it groups them to each instructor and finally order the result in descending number of lessons.



--List all ensembles held during the next week, sorted by music genre and weekday.
--For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.
SELECT
    e.genre,
    CASE
        WHEN COUNT(s.student_id) >= MAX(e.maximum_number_of_students) THEN 'Full'
        WHEN COUNT(s.student_id) >= MAX(e.maximum_number_of_students) - 2 THEN '1-2 Seats Left'
        ELSE 'More Seats Left'
    END AS seat_availability,
    EXTRACT(DOW FROM l.date_and_time::timestamp) AS weekday
FROM
    public.ensembles e
    JOIN public.lesson l ON e.lesson_id = l.lesson_id
    LEFT JOIN public.student s ON l.lesson_id = s.lesson_id
WHERE
    l.date_and_time::timestamp >= NOW()::date
    AND l.date_and_time::timestamp < NOW()::date + INTERVAL '7 days'
GROUP BY
    e.genre, l.date_and_time::timestamp
ORDER BY
    e.genre, weekday;
--It checks the number of booked places and the genre column of the Ensemble table. 
--Then it is doing a join between the ensemble table and lesson table and left join with the student table.
--It is then being filtered with the date specified and grouped with genre and weekday.
-- SELECT MAX(average_assistance_time) as max_average 
-- FROM( 
--   SELECT cohorts.name as cohort_name, AVG(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
--   FROM assistance_requests
--   INNER JOIN students
--   ON assistance_requests.student_id = students.id
--   INNER JOIN cohorts
--   ON  students.cohort_id = cohorts.id
--   GROUP BY cohorts.name
-- ) as average_assistance_table

SELECT cohorts.name, AVG(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
FROM assistance_requests
INNER JOIN students
ON assistance_requests.student_id = students.id
INNER JOIN cohorts
ON  students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
SELECT teachers.name as teacher, cohorts.name as cohort, COUNT (assistance_requests.*) as total_assistances
FROM teachers
INNER JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
INNER JOIN students
ON assistance_requests.student_id = students.id
INNER JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
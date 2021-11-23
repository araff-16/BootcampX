SELECT DISTINCT teachers.name as teacher, cohorts.name
FROM teachers
INNER JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
INNER JOIN students
ON assistance_requests.student_id = students.id
INNER JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;
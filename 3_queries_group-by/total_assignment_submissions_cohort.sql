SELECT cohorts.name as cohort, COUNT(assignment_submissions.*) as total_submissions
FROM students
INNER JOIN cohorts
ON students.cohort_id = cohorts.id
INNER JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;
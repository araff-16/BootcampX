SELECT SUM(assignment_submissions.duration) as total_duration
FROM students
INNER JOIN cohorts
ON students.cohort_id = cohorts.id
INNER JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
WHERE cohorts.name = 'FEB12';
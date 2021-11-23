SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration
FROM students
INNER JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
INNER JOIN assignments
ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date is NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration ;
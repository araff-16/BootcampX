SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
FROM students
INNER JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
WHERE students.end_date is NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;
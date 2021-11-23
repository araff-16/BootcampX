SELECT AVG (total_duration) as average_total_duration
FROM( 
  SELECT SUM(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
  FROM assistance_requests
  INNER JOIN students
  ON assistance_requests.student_id = students.id
  INNER JOIN cohorts
  ON  students.cohort_id = cohorts.id
  GROUP BY cohorts.name
) as total_durations_by_cohorts;
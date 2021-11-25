const { Pool } = require('pg');

//node arguments
const args = process.argv.slice(2);
console.log(args)


//specifyin connection options
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//checks to see if we connected ot database
pool.connect().then(() => {
  console.log("Connection to database established");
}).catch (e => {
  console.log('************ERROR************');
  console.log(e.message)
})

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name
FROM teachers
INNER JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
INNER JOIN students
ON assistance_requests.student_id = students.id
INNER JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name;`, [process.argv[2]])
.then(res => {
  console.log(res.rows)
}).catch(err => console.error('query error', err.stack))
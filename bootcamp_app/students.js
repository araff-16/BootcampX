const { Pool } = require('pg');

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
SELECT id, name, cohort_id
FROM students
LIMIT 5;
`)
.then(res => {
  console.log(res.rows);
})
.catch(err => console.error('query error', err.stack));
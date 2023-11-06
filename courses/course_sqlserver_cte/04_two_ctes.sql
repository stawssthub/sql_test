--All employees with work
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM employee e
INNER JOIN work_request w ON w.assigned_to = e.emp_id;

--In progress work assigned to IT employees
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM employee e
INNER JOIN work_request w ON w.assigned_to = e.emp_id
WHERE w.request_status != 'Done'
AND e.dept_id = 3;

--Query with two CTEs
WITH requests_in_progress (request_id, request_name, created_date, request_status, assigned_to) AS (
	SELECT
	request_id,
	request_name,
	created_date,
	request_status,
	assigned_to
	FROM work_request
	WHERE request_status != 'Done'
),
it_employees (emp_id, first_name, title) AS (
	SELECT emp_id, first_name, title
	FROM employee
	WHERE dept_id = 3
)
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM it_employees e
INNER JOIN requests_in_progress w ON w.assigned_to = e.emp_id;

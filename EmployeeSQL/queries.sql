--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary,
	s.from_date,
	s.to_date
FROM "Employees" e
	INNER JOIN "Salaries" s ON s.emp_no = e.emp_no
ORDER BY
	last_name,
	first_name,
	from_date DESC;

--List employees who were hired in 1986.
SELECT
	emp_no,
	last_name,
	first_name,
	gender,
	hire_date
FROM "Employees"
WHERE DATE_PART('YEAR',(hire_date)) = 1986
ORDER BY 
	hire_date DESC,
	last_name,
	first_name;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date
FROM "Dept_Manager" dm
	INNER JOIN "Departments" d ON d.dept_no = dm.dept_no
	INNER JOIN "Employees" e ON e.emp_no = dm.emp_no
ORDER BY
	d.dept_name,
	e.last_name,
	e.first_name;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Dept_Emp" de
	INNER JOIN "Employees" e ON e.emp_no = de.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no
ORDER BY
	d.dept_name,
	e.last_name,
	e.First_name;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM "Employees"
WHERE first_name = 'Hercules'
	AND LEFT(last_name, 1) = 'B'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Dept_Emp" de
	INNER JOIN "Employees" e ON e.emp_no = de.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY
	e.last_name,
	e.First_name;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Dept_Emp" de
	INNER JOIN "Employees" e ON e.emp_no = de.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY
	d.dept_name,
	e.last_name,
	e.First_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT(*) AS frequency_count
FROM "Employees"
GROUP BY last_name
ORDER BY frequency_count DESC;

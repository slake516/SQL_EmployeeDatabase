--Queries
--Q1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender,
	salary 
FROM employees 
LEFT JOIN salaries ON  employees.emp_no = salaries.emp_no;

--Q2.List employees who were hired in 1986.
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE extract(year from  hire_date)=1986;

--Q3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dpt.dept_no, dpt.dept_name, mgr.emp_no, 
	ee.last_name, ee.first_name, mgr.from_date, mgr.to_date
From departments as dpt
LEFT JOIN  dept_manager as mgr
on dpt.dept_no=mgr.dept_no
LEFT JOIN employees as ee
on mgr.emp_no=ee.emp_no;

--Q4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT  ee.emp_no, ee.last_name,ee.first_name,dpt.dept_name
FROM	employees as ee
LEFT JOIN dept_emp as dee
on dee.emp_no = ee.emp_no
LEFT JOIN departments as dpt
on dpt.dept_no = dee.dept_no;

--Q5.List all employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name
FROM	employees 
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--Q6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT dee.emp_no, ee.last_name, ee.first_name, dpt.dept_name
FROM dept_emp as dee
INNER JOIN employees as ee
on dee.emp_no = ee.emp_no
INNER JOIN departments as dpt
on dpt.dept_no = dee.dept_no
WHERE dept_name = 'Sales';

--Q7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dee.emp_no, ee.last_name, ee.first_name, dpt.dept_name
FROM dept_emp as dee
INNER JOIN employees as ee
on dee.emp_no = ee.emp_no
INNER JOIN departments as dpt
on dpt.dept_no = dee.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--Q8.In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Employee Count by Last Name"
FROM 	employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
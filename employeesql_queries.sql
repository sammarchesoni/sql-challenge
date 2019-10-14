--Data Analysis
-- 1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

-- 2.List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no,departments.dept_name,employees.emp_no,employees.last_name,employees.first_name,dept_manager.from_date,dept_manager.to_date
FROM employees
INNER JOIN dept_manager ON dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no;

-- 5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name
FROM employees
WHERE last_name LIKE 'B%' 
AND first_name='Hercules'; 

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY  "Count" DESC;
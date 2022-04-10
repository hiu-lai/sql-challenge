-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary FROM employees INNER JOIN salaries ON employees.emp_no=salaries.emp_no ORDER BY employees.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'yyyy') = '1986';

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT dept_no, 
	(SELECT dept_name FROM departments WHERE dept_manager.dept_no = departments.dept_no), 
	dept_manager.emp_no, last_name, first_name FROM dept_manager  JOIN employees ON dept_manager.emp_no=employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, last_name, first_name,
	(SELECT dept_name FROM departments WHERE dept_emp.dept_no = departments.dept_no)
		FROM dept_emp  JOIN employees ON dept_emp.emp_no=employees.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees WHERE (first_name='Hercules' AND last_name LIKE 'B%') ORDER BY last_name;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, (SELECT dept_name FROM departments WHERE dept.dept_no = departments.dept_no) 
	FROM employees JOIN (SELECT * FROM dept_emp WHERE dept_no IN (
		SELECT dept_no FROM departments WHERE dept_name='Sales')) as dept ON employees.emp_no = dept.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, (SELECT dept_name FROM departments WHERE dept.dept_no = departments.dept_no) 
	FROM employees JOIN (SELECT * FROM dept_emp WHERE dept_no IN (
		SELECT dept_no FROM departments WHERE dept_name='Sales' OR dept_name='Development')) as dept ON employees.emp_no = dept.emp_no;

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, count(last_name) as "name count" FROM employees group by last_name ORDER BY "name count" DESC;


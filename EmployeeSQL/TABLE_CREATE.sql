ALTER DATABASE "sql-challenge" SET datestyle TO 'ISO, MDY';

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE IF NOT EXISTS titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

DELETE FROM titles;

COPY titles(title_id, title)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\titles.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

DELETE FROM employees;

COPY employees 
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\employees.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

DELETE FROM departments;

COPY departments(dept_no, dept_name)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\departments.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

DELETE FROM dept_manager;

COPY dept_manager
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\dept_manager.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

DELETE FROM dept_emp;

COPY dept_emp 
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\dept_emp.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

DELETE FROM salaries;

COPY salaries(emp_no, salary)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\salaries.csv'
DELIMITER ','
CSV HEADER;



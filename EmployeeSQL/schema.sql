-- Deleting all tables and views to ensure clean data import

DROP TABLE IF EXISTS titles, employees, departments, dept_emp, dept_manager, salaries 
CASCADE; 
DROP VIEW IF EXISTS Emp_salary CASCADE;

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

COPY titles(title_id, title)
FROM 'C:\Users\Public\CSV_Files\titles.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE employees (
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
SET datestyle TO "ISO, MDY";

COPY employees 
FROM 'C:\Users\Public\CSV_Files\employees.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

COPY departments(dept_no, dept_name)
FROM 'C:\Users\Public\CSV_Files\departments.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

COPY dept_manager
FROM 'C:\Users\Public\CSV_Files\dept_manager.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

COPY dept_emp 
FROM 'C:\Users\Public\CSV_Files\dept_emp.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

COPY salaries(emp_no, salary)
FROM 'C:\Users\Public\CSV_Files\salaries.csv'
DELIMITER ','
CSV HEADER;

--CREATE additional VIEW TABLE for Bonus Analysis

CREATE VIEW Emp_salary AS (
	SELECT employees.emp_no, last_name, first_name, sex, salary, (SELECT title FROM titles WHERE titles.title_id=employees.emp_title_id) FROM employees 
	INNER JOIN salaries ON employees.emp_no=salaries.emp_no);

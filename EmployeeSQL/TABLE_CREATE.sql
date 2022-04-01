-- Only create tables if it doesn't exists
CREATE TABLE IF NOT EXISTS departments ( 
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR);

CREATE TABLE IF NOT EXISTS dept_emp (
emp_no int PRIMARY KEY,
dept_no VARCHAR);

CREATE TABLE IF NOT EXISTS dept_manager (
dept_no VARCHAR PRIMARY KEY,
emp_no VARCHAR);

-- incorrect format for dates (american date DATE format out of range)
CREATE TABLE IF NOT EXISTS employees (
emp_no int PRIMARY KEY,
emp_title VARCHAR,
birth_date VARCHAR,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date VARCHAR);

CREATE TABLE IF NOT EXISTS salaries (
emp_no int PRIMARY KEY,
salary int);

CREATE TABLE IF NOT EXISTS titles (
title_id VARCHAR PRIMARY KEY,
title VARCHAR);

-- DELETE to enough data copy imported once
DELETE FROM departments;
DELETE FROM dept_emp;
DELETE FROM dept_manager;
DELETE FROM employees;
DELETE FROM salaries;
DELETE FROM titles;

-- IMPORT Data from CSV
COPY departments(dept_no, dept_name)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp (emp_no, dept_no)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp (dept_no, emp_no)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\dept_manager.csv'
DELIMITER ','
CSV HEADER;


COPY employees (emp_no, emp_title, birth_Date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\employees.csv'
DELIMITER ','
CSV HEADER;

COPY salaries(emp_no, salary)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY titles(title_id, title)
FROM 'C:\Users\hk_la\Documents\homeworks\sql-challenge\EmployeeSQL\titles.csv'
DELIMITER ','
CSV HEADER;
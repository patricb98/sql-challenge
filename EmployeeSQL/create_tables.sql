-- Create tables
-- departments table
DROP TABLE departments
CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY (dept_no),
	dept_name VARCHAR(30) NOT NULL
)
SELECT * FROM departments

-- titles table
DROP TABLE titles
CREATE TABLE titles(
	title_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (title_id),
	title VARCHAR(30) NOT NULL
)
SELECT * FROM titles

-- employees table
DROP TABLE employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(2),
	hire_date DATE
)
SELECT * FROM employees

-- dept_employee table
DROP TABLE dept_employee
CREATE TABLE dept_employee(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)
SELECT * FROM dept_employee

-- dept_manager table
DROP TABLE dept_manager
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
SELECT * FROM dept_manager

-- salaries table
DROP TABLE salaries
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary INT
)
SELECT * FROM salaries

GRANT SELECT ON titles TO PUBLIC;

COPY titles FROM '/Users/patricbeaven/sql-challenge/Starter_Code/data/titles.csv' WITH CSV HEADER;
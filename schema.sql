-- CREATE AND IMPORT  TABLES 

-- title table
DROP TABLE IF EXISTS title;
--
CREATE TABLE title (
    title_id VARCHAR(50) PRIMARY KEY,
    title varchar   NOT NULL
);

SELECT *
FROM title;

-- employee table
DROP TABLE IF EXISTS employee;
--
CREATE TABLE employee (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50),
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR(50)   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);
SELECT *
FROM employee;

-- department table
DROP TABLE IF EXISTS department;
--
CREATE TABLE department (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);

-- dept_emp table
DROP TABLE IF EXISTS dept_emp;
--
CREATE TABLE dept_emp (
    emp_no INT ,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    dept_no VARCHAR(50),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

-- dept_manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no INT ,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

	
-- salary table	
DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT *
FROM  salary;

-- QUERIES
--1. Select the employee number, last name, first name, sex, 
--   and salary of all employees, ordered by employee number
SELECT employee.emp_no,employee.last_name, employee.first_name,employee.sex,salary.salary
FROM employee AS employee
JOIN salary AS salary ON employee.emp_no=salary.emp_no
ORDER BY employee.emp_no DESC;

--2. Select the first name, last name, and hiring date for all employees hired in 1986
SELECT last_name,first_name,hire_date
FROM employee 
WHERE hire_date > '1985-12-31'::date
AND hire_date < '1987-01-01'::date
ORDER BY hire_date;

-- 3. Select the department number, department name, employee number, last name, 
--    and first name of all managers of each department
SELECT department.dept_no, department.dept_name,m.emp_no,employee.last_name, employee.first_name
FROM department AS department
JOIN dept_manager AS m ON department.dept_no=m.dept_no
JOIN employee AS employee ON m.emp_no=employee.emp_no
ORDER BY employee.emp_no;

-- 4. Select the employee number, last name, first name, and department 
--     of each employee, ordered by employee number
DROP VIEW employee_department;

CREATE VIEW employee_department AS
SELECT employee.emp_no,employee.last_name, employee.first_name, department.dept_name
FROM employee AS employee
JOIN dept_emp AS dept ON employee.emp_no=dept.emp_no
JOIN department AS department ON dept.dept_no=department.dept_no
ORDER BY employee.emp_no;

SELECT *
FROM employee_department;

-- 5. Select first name, last name, birth date, and sex of all employees 
--    whose first name is "Hercules" and last name begins with a "B"
SELECT first_name,last_name,sex, birth_date
FROM employee 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

-- 6. Select employee number, last name, first name, and department 
--    name of all employees in the Sales department, ordered by employee number
SELECT *
FROM employee_department
WHERE dept_name LIKE 'Sales';

-- 7. Select employee number, last name, first name, and department name of 
--    all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT *
FROM employee_department
WHERE dept_name LIKE 'Sales'
OR dept_name LIKE 'Devel%';

-- 8. Count the number of employees, grouped by last name
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC;

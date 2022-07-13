-- Data Analysis
-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: 
-- employee number, 
-- last name, 
-- first name, 
-- sex, and 
-- salary.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
FULL OUTER JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no;



-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT "Employees".first_name, "Employees".last_name, "Employees".hire_date
FROM "Employees"
WHERE hire_date >= '1986/01/01'
AND hire_date <= '1986/12/31';



-- 3. List the manager of each department with the following information: 
-- department number, 
-- department name, 
-- the manager's employee number, 
-- last name, 
-- first name.
SELECT "Departments".dept_no, "Departments".dept_name, "Employees".emp_no, "Employees".last_name, "Employees".first_name
FROM "Departments"
JOIN "Dept_emp" ON "Dept_emp".dept_no = "Departments".dept_no
JOIN "Employees" ON "Employees".emp_no = "Dept_emp".emp_no
WHERE "Employees".emp_title = 'm0001';



-- 4. List the department of each employee with the following information: 
-- employee number, 
-- last name, 
-- first name, and 
-- department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments" ON "Departments".dept_no = "Dept_emp".dept_no;
-- There's about 30k more results in this, than 



-- 5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and 
-- last names begin with "B."
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
FROM "Employees"
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';



-- 6. List all employees in the Sales department, including their:
-- employee number, 
-- last name, 
-- first name, and 
-- department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments" ON "Departments".dept_no = "Dept_emp".dept_no
WHERE "Dept_emp".dept_no = 'd007';



-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, 
-- last name, 
-- first name, and 
-- department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments" ON "Departments".dept_no = "Dept_emp".dept_no
WHERE "Dept_emp".dept_no = 'd007' OR "Dept_emp".dept_no = 'd005';



-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT "Employees".last_name, COUNT("Employees".last_name) AS "Occurances"
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY "Occurances" DESC;
-- Data Analysis
-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
LEFT JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT "Employees".first_name, "Employees".last_name, "Employees".hire_date
FROM "Employees"
WHERE hire_date > 01/01/1986
AND hire_date < 12/31/1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
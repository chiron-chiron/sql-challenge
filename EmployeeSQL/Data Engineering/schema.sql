-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Heavily edited by SB

-- Clean database
DROP TABLE "Titles";
DROP TABLE "Salaries";
DROP TABLE "Employees";
DROP TABLE "Dept_manager";
DROP TABLE "Dept_emp";
DROP TABLE "Departments";


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(100)   NOT NULL,
    "dept_name" VARCHAR(100)   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(100)   NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(100)   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE "Employees" (
    "emp_no" int NOT NULL,
    "emp_title" VARCHAR(100)   NOT NULL,
    "birt_date" date   NOT NULL,
    "first_name" VARCHAR(100)  NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "sex" VARCHAR(100)   NOT NULL,
    "hire_date" date   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    PRIMARY KEY ("emp_no")
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(100)   NOT NULL,
    "title" VARCHAR(100)  NOT NULL,
    PRIMARY KEY ("title_id")
);

-- Next step was to import csv files
-- Only then can you create foreign keys below

-- Need to add these last, all tables need to be created first.
ALTER TABLE "Dept_emp"
ADD FOREIGN KEY(emp_no) REFERENCES "Salaries"(emp_no);

ALTER TABLE "Dept_manager"
ADD FOREIGN KEY (dept_no) REFERENCES "Departments"(dept_no),
ADD FOREIGN KEY(emp_no) REFERENCES "Employees"(emp_no);

ALTER TABLE "Employees"
ADD FOREIGN KEY (emp_title) REFERENCES "Titles"(title_id),
ADD FOREIGN KEY (emp_no) REFERENCES "Salaries"(emp_no);

-- Salaries doesn't need foreign key, other tables will be referencing it.
-- ALTER TABLE "Salaries"
-- ADD FOREIGN KEY(emp_no) REFERENCES "Dept_emp"(emp_no, dept_no);

-- Titles doesn't need a foreign key, other tables will be referencing it.
-- ALTER TABLE "Titles"
-- ADD FOREIGN KEY (title_id) REFERENCES "Employees"(emp_title);

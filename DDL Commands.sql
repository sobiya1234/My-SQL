-- To create employees database
CREATE DATABASE employees;
USE employees;

CREATE TABLE department(
department_id INT,
department_name VARCHAR(100)
);

CREATE TABLE location(
location_id INT,
location VARCHAR(30)
);

CREATE TABLE employee(
employee_id INT,
employee_name VARCHAR(50),
gender ENUM('M','F'),
age INT,
hire_date DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2)
);

-- ALTER TABLE-ADD 
ALTER TABLE employee
ADD COLUMN email VARCHAR(100);

-- ALTER TABLE-MODIFY
ALTER TABLE Employee 
MODIFY COLUMN designation VARCHAR(100);

-- ALTER TABLE-DROP
ALTER TABLE employee
DROP COLUMN age;

-- TABLE RENAME department
RENAME TABLE department to Departments_Info;
RENAME TABLE location to Locations;

-- TABLE TRUNCATE employee
TRUNCATE TABLE employee;

-- TABLE DROP employee
DROP TABLE employee;
DROP DATABASE employees;




 





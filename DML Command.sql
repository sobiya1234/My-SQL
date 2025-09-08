-- To Create Employee Database
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

CREATE TABLE employees(
employee_id INT,
employee_name VARCHAR(50) NOT NULL,
gender ENUM('M','F'),
age INT,
hire_date DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2)
);



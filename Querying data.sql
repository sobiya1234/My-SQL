-- To create database employee database
use employee;

-- select Distinct VALUES

select distinct slary
from employee;

-- AS - Alias
SELECT age AS Employee_Age, salary AS Employee_Salary
 FROM employee;

-- select Where
SELECT employee_id, 
employee_name, salary, (salary * 1.10) AS net_salary 
from employee;

SELECT employee_id, 
employee_name, salary, hire_date FROM employee 
WHERE salary > 50000 AND hire_date < '2016-01-01';

SELECT * FROM employee 
employee_id, 
employee_name, 
designation
WHERE designation IN ('Data Analyst', 'Data Scientist');

-- other operators
SELECT * 
from employee 
WHERE designation = 'Data Scientist' IS NULL;

SELECT * 
from employee, employee_id, employee_name, department_id 
WHERE department_id IN (1, 3, 4, 9, 12);

SELECT * 
from employee, employee_name, salary 
WHERE salary NOT BETWEEN 50000 AND 80000;

select * 
FROM employee
where employee_name regexp '^[AEIOUaeiou]';

SELECT * FROM employee.employee, 
employee_name  WHERE employee_name LIKE '_sh%';
 
 -- Sorting and Grouping Data:
 -- ORDER BY
 SELECT *
 FROM employee, hire_date 
 WHERE hire_date > '2019-01-01' 
 ORDER BY hire_date;
 
 SELECT *
 from employee, employee_name, department_id, 
 salary  ORDER BY department_id ASC, salary DESC;
 
-- LIMIT 
 SELECT * from employee, employee_name, salary  
 ORDER BY salary
 DESC LIMIT 10;
 
 SELECT employee_id, employee_name, hire_date 
 FROM employee
 WHERE hire_date BETWEEN '2018-01-01' AND '2018-12-31' 
 ORDER BY hire_date 
 LIMIT 5;
 
 select SUM(salary) AS total_salary
 from employee
 where department_id = 'finance';
 
 select sum(salary) AS total_salary
 from employee
 where department_id = '10';

-- MIN()
SELECT MIN(age) AS minimum_age
 FROM employee;

-- Group by
SELECT MIN(age) AS minimum_age
 FROM employee;

SELECT designation, AVG(salary) AS average_salary
 FROM employee
 WHERE designation LIKE '%Analyst%' GROUP BY designation;

-- Having
SELECT department_id, COUNT(*) AS employee_count
 FROM employee 
 GROUP BY department_id HAVING COUNT(*) < 3;

SELECT location, AVG(age) AS average_age
 FROM employee WHERE gender = 'Female'
 GROUP BY location_id HAVING AVG(age) < 30;

 


       
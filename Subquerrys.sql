
use employee;

select * from employees;
select * from departments;
select * from location;

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT * FROM employees
WHERE department_id = (
SELECT department_id FROM employees 
WHERE employee_name = 'Arjun Kumar'
);

SELECT * FROM departments
WHERE department_id IN (
SELECT department_id FROM departments 
WHERE department_name LIKE '%Development%'
);

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartmentName(IN dept_name VARCHAR(100))
BEGIN
    SELECT e.* 
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = dept_name;
END //

DELIMITER ;


CALL GetEmployeesByDepartmentName('IT');
CALL GetEmployeesByDepartmentName('Human Resources');

sELECT employee_id,
       employee_name,
       YEAR(CURDATE()) - age AS approximate_birth_year
FROM Employees;

DELIMITER //

CREATE PROCEDURE FindEmployeeBirthYearByID(IN emp_id INT, OUT birth_year INT)
BEGIN
    -- Calculate approximate birth year
    SELECT YEAR(CURDATE()) - age
    INTO birth_year
    FROM Employees
    WHERE employee_id = emp_id;
END//

DELIMITER ;

SELECT employee_id,
       employee_name,
       YEAR(CURDATE()) - age AS approximate_birth_year
FROM Employees
WHERE employee_id IN (5004, 5018, 5029);
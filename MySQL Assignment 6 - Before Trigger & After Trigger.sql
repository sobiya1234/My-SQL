use employee;

SELECT * FROM employees;

-- Before Insert Trigger
DELIMITER //

CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary IS NULL THEN
        SET NEW.salary = (SELECT AVG(salary) FROM employees WHERE salary IS NOT NULL);
        
    END IF;
END;
//

DELIMITER ;
-- Insert an employee with a specified salary
INSERT INTO employees (employee_name, salary) VALUES ('Jane Smith', 60000);

-- After Delete Trigger
DELIMITER //

CREATE TRIGGER prevent_recent_employee_deletion
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    -- Get the most recent year of joining
    SELECT MAX(YEAR(hire_date)) INTO @most_recent_year FROM employees;

    -- Check if the deleted employee joined in the most recent year
    IF YEAR(OLD.hire_date) = @most_recent_year THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employees who joined in the most recent year.';
    END IF;
END //

DELIMITER ;
set sql_safe_updates=0;
DELETE FROM employees WHERE employee_name = 'Charlie';



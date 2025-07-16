# Stored Procedures:
USE parks_and_recreation;
-- SET SQL_SAFE_UPDATES = 0; # Optional learn later
# To reuse a procedure name we need to drop them first:
DROP PROCEDURE IF EXISTS large_salaries;
# Similar to a function we can hole multiple complex queries in a stored procedure

DELIMITER $$  

CREATE PROCEDURE large_salaries()
BEGIN
    -- Selecting employees with salaries > 50000
    SELECT * FROM employee_salary WHERE salary > 50000;

    -- Selecting genders for employees with salaries > 50000
    SELECT dem.gender, sal.salary, sal.first_name
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    WHERE sal.salary > 50000;
END $$  

DELIMITER ;

#Check if the procedure is created:
Show procedure status where Db = 'parks_and_recreation';

# Call the created Procedure:
CALL large_salaries();

# Now moving further we can utilize the parameter in a stored procedure to filter out or search a specific item from the contents of the procedure:

DELIMITER //
Create Procedure pick_out(emp_id INT)
Begin
	Select salary
    From employee_salary
    Where employee_id = emp_id;
End//
DELIMITER ;

Show Procedure Status Where Db = 'parks_and_recreation';

Call pick_out(1);

# Note:
-- If you define multiple parameters in your procedure, you must pass all of them when calling it. Always match the number of paramters created in the procedure. 

-- Not doing so results in Error 1318.

-- MySQL doesn't support default parameter values like some other databases (e.g., PostgreSQL), so you’ll need to handle it manually using IF ELSE statement.

-- IF dept IS NULL THEN
--   -- Skip filtering by dept_id
-- ELSE
--   -- Apply the condition
-- END IF; 
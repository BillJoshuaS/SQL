-- Joins
-- Joins allow us to combine two or more tables together if they have a common column or common data that we can use
USE parks_and_recreation;
  
  Select * from employee_demographics;
  
  Select * from employee_salary;
  
-- INNERJOIN or JOIN since by default it means the same:
Select *
from employee_demographics
JOIN employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id
;

-- Or we can improvise the code as follows:
 Select *
from employee_demographics as dem
INNER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- We can also select specific columns: but we have to mention the similar column names with table alias or name: 
  Select dem.employee_id, age, occupation, salary
from employee_demographics as dem
INNER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- OUTER JOINS: It has Left Join and Right Join
-- Left Outer Join/Left Join - means it takes all the columns from the left table(FROM table) and prints all the matching rows from the right table (Joining table):

   Select *
from employee_demographics as dem
LEFT JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- Right Outer Join/Right Join - means its vice versa to the left join, and if there is no matching info in the left table then the control will simply print NULL:

Select *
from employee_demographics as dem
RIGHT OUTER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
;

# Multi Table Join:

Select * from parks_departments;

 Select *
from employee_demographics as dem
INNER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	on pd.department_id = sal.dept_id
;
 
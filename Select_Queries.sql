USE `Parks_and_Recreation`;

SELECT * FROM parks_and_recreation.employee_demographics;

Select * from parks_and_recreation.employee_salary;

select first_name from parks_and_recreation.employee_salary;

select first_name, age, birth_date from parks_and_recreation.employee_demographics;

# We can calculate or do arithmetic manipulations while selecting, and it will print the result in a separate o/p column and it follows PEMDAS
select age, (age + 5) * 2 - 1 from parks_and_recreation.employee_demographics;

# Utilizing DISTINCT function: would rpovide only the unique values from a specified column
select distinct gender from parks_and_recreation.employee_demographics;




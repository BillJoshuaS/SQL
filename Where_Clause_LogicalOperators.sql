USE `Parks_and_Recreation`;

select * from employee_salary where first_name = 'Leslie';

select * from employee_salary where salary > 50000;
select * from employee_salary where salary >= 50000; #similarly we can make use of < <= != and these are all comparison operators in SQL

# We can make use of comparison with the date feature. Consider the standard date format in MySQL yyyy-mm-dd
select * from employee_demographics where birth_date > '1985-01-01';

-- AND OR NOT -- Logical Operators
select * from employee_demographics 
where birth_date > '1985-01-01'
AND gender = 'male'; 

select * from employee_demographics 
where birth_date > '1985-01-01'
OR gender = 'male'; 

# PEMDAS works in the logical operators as well, in below query we will create an isolated conditional statement along with more than one logical ops
select * from employee_demographics 
where (first_name = 'Tom' AND age = 36) 
OR age > 55;

#LIKE statement
# % means anything after or before the search string and _ represents any single character space after a specific char.
#These helps in searching for certain strings tagged with LIKE statement
select * from employee_demographics
where first_name LIKE 'jer%';

select * from employee_demographics
where first_name LIKE '%er%';

# To get the names that starts with A.
select * from employee_demographics
where first_name LIKE 'a%';

# To get the name that starts with an A and only has 2 chars after that.
select * from employee_demographics
where first_name LIKE 'a__';

select * from employee_demographics
where first_name LIKE '%a_r_%';
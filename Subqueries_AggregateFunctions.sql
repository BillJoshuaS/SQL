#Subqueries:
-- Its basically a query within an another query.
Use parks_and_recreation;
select * from employee_salary;
Select * from parks_departments;
select * from employee_demographics;

# The below query would give an error, since first name is a non-aggregate column:
select  first_name, avg(salary) from employee_salary; 

#Note: when we use an aggregate function in SQL it will provide us an aggregate column, such as AVG(Salary) gives a single row result with the average value of all rows.
# Hence it wont be able to display all the rows in an non aggregate column unless we group by that column.
select  first_name, avg(salary) from employee_salary group by first_name; -- But here its useless since all the names are unique

-- Aggregate column: A column that is processed using an aggregate function to summarize multiple rows.

#But it depends on how we approach the idea of using the aggregate function:
select  dept_id, avg(salary) from employee_salary group by dept_id; -- So here we get the avegare salary department wise.

-- To make this a subquery: Here we can see the actual salary of each employee along with the avg salary and compare.
select first_name, salary,
(select avg(salary) from employee_salary)
from employee_salary;

# Task: Take the gender and find the avg salary for them.

-- select first_name, last_name, gender, (select salary from employee_salary) from employee_demographics;
Select dem.first_name, dem.last_name, gender, salary
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id;

-- To get the avg age as per gender we could use group by:
Select gender, avg(age), count(gender) as Employee_count, max(age) Max_Age, min(age) Min_Age
from employee_demographics
group by gender; 

#Important note: To create a multiple query subquery, its better to create each of the combination query separately and then write them together.
Select * from
(Select dem.first_name, dem.last_name, gender, salary
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id) as Salary_Hint; -- while selecting and creating a new table set it is required to name an alias for that table 'Salary_Hint' 

# We can now do further processing with the extracted data in our subquery as below:
 
Select gender, avg(salary) Avg_Salary from
(Select dem.first_name, dem.last_name, gender, salary
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id) as Salary_Hint group by gender; -- Here we were able to get the average salary of Femal and Male employees.  

#Describing a table:
desc employee_salary;
desc employee_demographics;

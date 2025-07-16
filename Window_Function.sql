# Window Function:

Use parks_and_recreation;

select * from employee_salary;
Select * from parks_departments;
select * from employee_demographics;

# Join example:

Select first_name, last_name, salary, dep.department_name
from employee_salary as sal
join parks_departments as dep
	On sal.dept_id = dep.department_id;
    
# Over() aggregate function:

select gender, avg(salary) avg_salary
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id
group by gender;

-- Now instead of rolling up everything using group by we can use Over() to get the avg over all the values:
select gender, avg(salary) over()
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id;

-- Also if we need to get a seperate avg salary response for each row, we can use partition:
select gender, salary, avg(salary) over(partition by gender) Avg_Salary, sum(salary) over(partition by gender) Total_sal
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id;

-- We can also add a rolling total/running total response in SQL:
select gender, salary, avg(salary) over(partition by gender) Avg_Salary, sum(salary) over(partition by gender order by dem.employee_id) Total_sal
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id;

desc employee_demographics;
    
-- Moving average:
select gender, salary, avg(salary) over(partition by gender) Avg_Salary, sum(salary) over(partition by gender order by dem.employee_id) Running_Total,
avg(salary) over(partition by gender order by dem.employee_id) Moving_Avg
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id;

# Count without grouping:
Select gender, salary, dem.first_name, dem.last_name, count(gender) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- Simple count(): 
Select gender, count(*) count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

# LAG() and LEAD():

-- Normal select: 
SELECT first_name, last_name, salary
FROM employee_salary
ORDER BY salary DESC;

-- Lag() gets the previous row value:
SELECT first_name, last_name, salary,
       LAG(salary) OVER (ORDER BY salary DESC) AS prev_salary
FROM employee_salary;

-- Lead() gets the next row value.
 SELECT first_name, last_name, salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employee_salary;

# ROW NUMBER, Rank and Dense Rank
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender) as row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank() over(partition by gender order by salary desc) rank_dense
from employee_salary sal
join employee_demographics dem
	on sal.employee_id = dem.employee_id;
    
-- ROW_NUMBER => would simply add the number of rows positionally, it wont consider the numerical or any other values for numbering.
-- Rank => would rank the rows according to the [order by] clause specified, if the order by points a numerical column numeric ranking and
-- if it points a string or alphanumeric column alphabet order ranking would be apply. Position will be calculated (i.e if we have a tie like two 4th ranks 5th rank will be skipped so the next will be 6th)
--  DENSE_RANK => This works similar to the RANK() but it wont consider the position for ranking, so if we have two 5th ranks the next will be 6th unlike RANK where it will be 7th.
-- Lag and Lead are used widely to compare previous and next values such as comapring everyday sales with previous days or vise versa.


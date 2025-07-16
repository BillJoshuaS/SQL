# CTE - Common Table Expression:

Use parks_and_recreation;

-- This allows us to reference a query in another query instead of writing a subquery.
-- We will build a subquery and reference that to use it in another query.
-- WITH is the major keyword to create a CTE:

WITH CTE_Example1 as
(
select * from employee_demographics
)

Select * from CTE_Example1;
# A CTE has to be called imediately after the creation. Calling that in the next statement would throw an error.
Select * from CTE_Example1;

# Complex CTE example:
With CTE_Example2 as
(
Select gender, avg(salary) avg_salary, max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)

Select avg(avg_salary) total_avg_sal from CTE_Example2;

# Note: We can get the exact output using subqueries, but the use of CTE improvise the code readability. Below is the subquery that does the same as the CTE.
Select avg(avg_salary) from
(
Select gender, avg(salary) avg_salary, max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery;

# Also we can create n number of CTE's and use them in the next statement.
With CTE_Example1 as
(
Select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as
(
select employee_id, first_name, last_name, salary, sum(salary) over() as running_total
from employee_salary where salary > 40000
order by salary DESC
)
Select * 
from CTE_Example1
join CTE_Example2
	on CTE_Example1.employee_id = CTE_Example2.employee_id;

# Note in CTE we can set the column names while creating a CTE in the first line and this would be given priority and it will overwrite whatever names specified inside the query.
With CTE_Example3 (gender, AVG_Sal, Max_S, Min_S, Cnt) as
(
Select gender, avg(salary) avg_salary, max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
Select * from CTE_Example3;

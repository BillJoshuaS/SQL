# Having VS Where
USE parks_and_recreation;

-- Causes an error since where clause condition is before the group by
select gender, avg(age)
from parks_and_recreation.employee_demographics
where avg(age) > 40
group by gender
;

-- To rectify this we need to use Having:
select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40
;

-- To use both in a single query:
select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 70000
; 

-- HAVING is used after GROUP BY to filter the result of aggregate functions like COUNT(), SUM(), AVG(), etc.
-- Think of it as the WHERE clause for groups.
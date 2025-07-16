-- Limit and Aliasing:
USE parks_and_recreation;

# Limits the result to first 3 rows or any mentioned number of rows:
select * 
from parks_and_recreation.employee_demographics 
order by first_name
limit 3;

# To print the specific row details we can use this by adding another parameter to limit:
# Task: find the 3 oldest employees: 
select * 
from parks_and_recreation.employee_demographics 
order by age DESC
limit 3;

# Task: Find the third oldest employee alone:
select * 
from parks_and_recreation.employee_demographics 
order by age DESC
limit 2, 1; # starts from second and gives the next element which is stated as 2,1

# Aliasing:
-- The processes of giving a name to a sorted out column or detail: Denoted by AS
-- Note it would still work without the keyword 'AS' such as  'avg(age) Avg_age'
select gender, avg(age) AS Avg_age
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40
; 
# Case statement

Use parks_and_recreation;

Select first_name, last_name, age,
case
	when age <= 30 then 'young'
    when age between 31 and 50 then 'old'
    when age >= 50 then 'too old'
end as Generation
from employee_demographics;

# Task:
-- salary < 50000 = 5% bonus
-- salary > 50000 = 7% bonus
-- In Finance Team = 10% bonus

Select * from employee_salary;
Select * from parks_departments;

# We can add any number of case statements, and each case adds a new feature or calculations.
 Select first_name, last_name, salary,
case
	when salary < 50000 then salary + (Salary * 0.05)
    when salary >= 50000 then salary + (Salary * 0.07)
end as New_Salary,
case
	when dept_id = 6 then salary * 0.1
end as bonus
from employee_salary;
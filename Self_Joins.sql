# Self Join: In SQL it is a join where a table is joined with itself. It is useful when comparing rows within the same table.
# Typically involves a JOIN condition that compares different rows within the table. And it could be any JOIN condition.

Use parks_and_recreation;

SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

SELECT *
FROM parks_and_recreation.employee_demographics as dem1
LEFT JOIN parks_and_recreation.employee_demographics as dem2
	ON dem1.employee_id = dem2.employee_id;

#Creating a table to understand this better:

Create table employee_store if not exists (
employee_id int not null,
first_name varchar(50),
last_name varchar(50),
hourly_pay float,
job varchar(30),
hire_date date
);

Insert into employee_store (employee_id, first_name, last_name, hourly_pay, job, hire_date)
values
(1, 'Eugene', 'Krabs',25.50 ,'manager','2025-01-02'),
(2, 'Squidward', 'Tentacles',15.00 ,'cashier','2025-01-03'),
(3, 'Spongebob', 'Squarepants',12.50 ,'cook','2025-01-04'),
(4, 'Patrick', 'Star',12.50 ,'cook','2025-02-05'),
(5, 'Sandy', 'Cheeks',17.50 ,'asst. manager','2025-01-06'),
(6, 'Sheldon', 'Plankton',10.00 ,'janitor','2025-01-07')
;


Select * from employee_store as str;

ALter table employee_store add supervisor_id int;

Alter table employee_store add primary key (employee_id);

update employee_store set supervisor_id = 5 where employee_store.employee_id in (3,4,6);
update employee_store set supervisor_id = 1 where employee_id = 5;

# We may use inner join or left join according to our requirements. So Self Join is used to asses heirarchy of data within a table or comapare anything within a table.
Select str1.employee_id, str1.first_name, str1.last_name, str1.supervisor_id, concat(str2.first_name, " ", str2.last_name) as Supervisor 
from employee_store as str1
Join employee_store as str2
	on str1.supervisor_id = str2.employee_id;

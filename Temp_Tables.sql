# Temporary Table: These are like regular tables that stays in the system immediate memory. Once the session console is closed the table vanishes unlike regular SQL tables.
Use parks_and_recreation;

Create temporary table tem_table
(
name varchar(50),
Occupation varchar(50),
age int,
hobby varchar(50)
);

insert into tem_table
values ('Bill', 'Sales', 26, 'Games'),
('Mike', 'Nurse', '34', 'Fitness');

select * from tem_table;

# A temporary table is similar to a CTE but has a wider scope of use. It can be used to extract specific features from a primary table and store it for tmep use.
Create Temporary Table salary_over_50k
(
select * from employee_salary where salary > 50000
);

Select * from salary_over_50k;

# Often used for more complex data manipulations.
# CTE's are used commenly for simpler tasks.
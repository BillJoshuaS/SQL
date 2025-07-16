USE parks_and_recreation;

# Group By
# The query groups the data into category sets for all the duplicate values.
select gender 
from parks_and_recreation.employee_demographics
group by gender
;

# It allows us to utilize the agregate functions along with the group and order functions:
-- To get the average age of each gender. 
select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
;

# We can group any number of features from the table with respect to a specific column/feature:
-- for example we are grouping various columns with resp to employee occupation.

# Since you are grouping by occupation, the query doesn't know how to handle other columns like salary, employee_name, etc., because there could be multiple values for these columns within each group.
select occupation
from parks_and_recreation.employee_salary
group by occupation
;

# Grouping multiple classes

select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary;

# Multiple classes along with agregate function, so that all the occupation category salary would have mean value with no duplicate rows with resp to Occupation alone.
select occupation, avg(salary) as avg_salary
from parks_and_recreation.employee_salary
group by occupation;

# Similarly we can use multiple agregate functions
select gender, avg(age) as Mean_Age, max(age) as Max_Age, min(age) as Min_Age, count(age) 
from parks_and_recreation.employee_demographics
group by gender
;	

# Order By. This is basically used to sort the column in ascneding or descending order
-- The below query changes the order of first_name in ascending order since by default the order by will alter the column in ASC
select * 
from parks_and_recreation.employee_demographics 
order by first_name;

# We can explicitely recommend the order to be Descneding
select * 
from parks_and_recreation.employee_demographics 
order by first_name DESC;

# We can make use of multiple columns and order them accordingly:
select * 
from parks_and_recreation.employee_demographics 
order by gender;

-- Note the there can be any num of columns mentioned in the order by but the priority decreases from left to right i.e the leftmost column will get sorted as high priopity:
select * 
from parks_and_recreation.employee_demographics 
order by gender, age;

-- We can also write the same query with the help of column positions. But not recommended since this is prone to future errors while column order changes. 
select * 
from parks_and_recreation.employee_demographics 
order by 5, 4;

-- Important to note that column without unique values is likely to be given first priority in OrderBy such as the gender for clear view of output.
select * 
from parks_and_recreation.employee_demographics 
order by age, gender;

-- In SQL, aggregate functions perform calculations on a set of values and return a single value. They are commonly used with the GROUP BY clause to summarize data.
-- Here’s a concise list of **SQL aggregate functions** along with a short description of each:


-- ### 1. **COUNT**
--    - **Description**: Counts the number of rows or non-NULL values in a column.
--    - Example: `COUNT(*)`, `COUNT(column_name)`, `COUNT(DISTINCT column_name)`.

-- ---

-- ### 2. **SUM**
--    - **Description**: Calculates the total sum of a numeric column.
--    - Example: `SUM(salary)`.

-- ---

-- ### 3. **AVG**
--    - **Description**: Calculates the average value of a numeric column.
--    - Example: `AVG(salary)`.

-- ---

-- ### 4. **MIN**
--    - **Description**: Finds the minimum value in a column.
--    - Example: `MIN(salary)`.

-- ---

-- ### 5. **MAX**
--    - **Description**: Finds the maximum value in a column.
--    - Example: `MAX(salary)`.

-- ---

-- ### 6. **GROUP_CONCAT** (or **STRING_AGG**)
--    - **Description**: Concatenates values from multiple rows into a single string.
--    - Example: `GROUP_CONCAT(employee_name)` (MySQL), `STRING_AGG(employee_name, ', ')` (SQL Server).

-- ---

-- ### 7. **VAR_POP**
--    - **Description**: Calculates the population variance of a numeric column.
--    - Example: `VAR_POP(salary)`.

-- ---

-- ### 8. **VAR_SAMP**
--    - **Description**: Calculates the sample variance of a numeric column.
--    - Example: `VAR_SAMP(salary)`.

-- ---

-- ### 9. **STDDEV_POP**
--    - **Description**: Calculates the population standard deviation of a numeric column.
--    - Example: `STDDEV_POP(salary)`.

-- ---

-- ### 10. **STDDEV_SAMP**
--    - **Description**: Calculates the sample standard deviation of a numeric column.
--    - Example: `STDDEV_SAMP(salary)`.

-- ---

-- ### 11. **BIT_AND**
--    - **Description**: Performs a bitwise AND operation on a set of values.
--    - Example: `BIT_AND(flags)`.

-- ---

-- ### 12. **BIT_OR**
--    - **Description**: Performs a bitwise OR operation on a set of values.
--    - Example: `BIT_OR(flags)`.

-- ---

-- ### 13. **BIT_XOR**
--    - **Description**: Performs a bitwise XOR operation on a set of values.
--    - Example: `BIT_XOR(flags)`.

-- ---

-- ### 14. **ARRAY_AGG**
--    - **Description**: Aggregates values into an array (available in PostgreSQL and others).
--    - Example: `ARRAY_AGG(employee_name)`.

-- ---

-- ### 15. **JSON_AGG**
--    - **Description**: Aggregates values into a JSON array (available in PostgreSQL and others).
--    - Example: `JSON_AGG(employee_name)`.

-- ---

-- ### 16. **PERCENTILE_CONT**
--    - **Description**: Computes a percentile based on a continuous distribution.
--    - Example: `PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary)`.

-- ---

-- ### 17. **PERCENTILE_DISC**
--    - **Description**: Computes a percentile based on a discrete distribution.
--    - Example: `PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY salary)`.

-- ---

-- ### 18. **MEDIAN**
--    - **Description**: Calculates the median value of a numeric column (available in some databases like Oracle).
--    - Example: `MEDIAN(salary)`.

-- ---

-- ### 19. **MODE**
--    - **Description**: Finds the most frequent value in a column (available in some databases like PostgreSQL).
--    - Example: `MODE() WITHIN GROUP (ORDER BY salary)`.

-- ---

-- ### 20. **COLLECT**
--    - **Description**: Aggregates values into a nested table (available in Oracle).
--    - Example: `COLLECT(employee_name)`.

-- ---

-- ### 21. **CORR**
--    - **Description**: Calculates the correlation coefficient between two numeric columns.
--    - Example: `CORR(salary, bonus)`.

-- ---

-- ### 22. **COVAR_POP**
--    - **Description**: Calculates the population covariance between two numeric columns.
--    - Example: `COVAR_POP(salary, bonus)`.

-- ---

-- ### 23. **COVAR_SAMP**
--    - **Description**: Calculates the sample covariance between two numeric columns.
--    - Example: `COVAR_SAMP(salary, bonus)`.

-- ---

-- ### 24. **REGR_SLOPE**
--    - **Description**: Calculates the slope of the linear regression line between two numeric columns.
--    - Example: `REGR_SLOPE(salary, bonus)`.

-- ---

-- ### 25. **REGR_INTERCEPT**
--    - **Description**: Calculates the intercept of the linear regression line between two numeric columns.
--    - Example: `REGR_INTERCEPT(salary, bonus)`.

-- ---

-- ### Notes:
-- - Aggregate functions ignore `NULL` values (except for `COUNT(*)`).
-- - Some functions (e.g., `GROUP_CONCAT`, `ARRAY_AGG`, `JSON_AGG`) are database-specific and may not be available in all SQL implementations.

-- Let me know if you need further clarification or examples! 😊 
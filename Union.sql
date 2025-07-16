# Unions
# These allows us to combine rows together unlike joins that concats columns together.

Use parks_and_recreation;

Select * from employee_salary;
Select * from employee_demographics;

# Here we union the names from both the tables, but we would not get them duplicated twise. This is because by default the Union is implicitely DISTINCT
Select first_name, last_name
from employee_demographics
Union # By Default - Union Distinct
Select first_name, last_name
from employee_salary;

# To run all of the Union results incuding the duplicates use 'Union All'
Select first_name, last_name
from employee_demographics
Union All
Select first_name, last_name
from employee_salary;

# Test Case - We need to select the Older and highest payed employees in the organization:

Select first_name, last_name, 'Old Male Employee' as Category # Here the Category part is called labelling and the label here is 'Old Male'
from employee_demographics
Where age>40 and gender = 'Male'

Union

Select first_name, last_name, 'Old Female Employee' as Category
from employee_demographics
Where age>40 and gender = 'Female'

Union

Select b.first_name, b.last_name, 'Highly Paid Male Employee' as Category
from employee_salary as b
Join employee_demographics as a on a.employee_id = b.employee_id
Where salary>70000 and a.gender = 'Male'

Union

Select b.first_name, b.last_name, 'Highly Paid Female Employee' as Category
from employee_salary as b
Join employee_demographics as a on a.employee_id = b.employee_id
Where salary>70000 and a.gender = 'Female'
Order by first_name, last_name
;

#Note we have an alternative to union called INTERSECT
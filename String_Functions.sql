# String Functions:
Use parks_and_recreation;
Select length('Sky') as string_len;

# We can get the length of the feature as needed.(Such as mobile number length to check if they fulfill the number of digits as per the country)
select first_name, length(first_name) as name_length
from employee_demographics
Order by name_length DESC;

# UPPER and LOWER case functions:
Select upper('sKYhigh') as Upper_Case;
Select lower('SKYHigh') as Lower_Case;

select first_name, Upper(first_name) as name_up
from employee_demographics
Order by 2;


# Trim function: there are left trim, right trim. This takes the white spaces beside our targeted string.
Select trim('        sky       ') as trimmed;

Select ltrim('        sky       ') as left_trimmed;
Select rtrim('        sky       ') as left_trimmed;

#SUBSTRING, LEFT and RIGHT functions: to crop a string with index position:
Select first_name,
LEFT(first_name, 4), # 4 chars from the left.
right(first_name, 4), # 4 chars from the right.
substring(first_name, 3, 2), # From 3rd position and to the right 2 chars. Here 3rd position will be incuded, so we get 3rd and 4th alone
substring(birth_date, 6, 2) as Birth_month # For ex we can use substring to get the months from the date.
from employee_demographics;

# Replace function: It will replace the char at a specifc location.
Select first_name, replace(first_name, 'a', 'z') # replace lowercase 'a' with 'z'. This function us case sensitive.
from employee_demographics;

# Locate:
# Used to locate and find certine patterns of chars in a column: It will return the count of elements from the column that had the target char pattern.
select first_name, locate('An', first_name) as name_up
from employee_demographics;

#Concat:
select first_name, last_name,
concat(first_name, ' ', last_name) full_name
from employee_demographics;

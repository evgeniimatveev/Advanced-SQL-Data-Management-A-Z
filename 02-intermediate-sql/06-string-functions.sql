-- Step 1: Select the database to use
-- We start by selecting the `classicmodels` schema, which contains the `customers` table.
USE classicmodels;

-- Step 2: Concatenate the first and last name using CONCAT function
-- The `CONCAT` function is used to concatenate two or more strings together.
-- In this case, we are combining the first name (`contactFirstName`) and last name (`contactLastName`) 
-- with a space (' ') in between.
-- We use the alias `Full_name` to give the resulting column a meaningful name.
SELECT CONCAT(contactFirstName, ' ', contactLastName) AS Full_name
FROM customers;

-- Step 3: Calculate the length of the first name using LENGTH function
-- The `LENGTH` function returns the number of characters in a string.
-- Here, we are using it to find the length of each customer's first name (`contactFirstName`).
SELECT LENGTH(contactFirstName) 
FROM customers;

-- Step 4: Find the maximum length of first names using MAX function
-- The `MAX` function is used to return the maximum value from a column.
-- Here, we are combining it with the `LENGTH` function to find the longest first name in the table.
SELECT MAX(LENGTH(contactFirstName)) 
FROM customers;

-- Step 5: Trim spaces from the first name using TRIM function
-- The `TRIM` function removes leading and trailing spaces from a string.
-- In this case, it is used to clean up the `contactFirstName` field by removing any extra spaces.
SELECT TRIM(contactFirstName)
FROM customers;
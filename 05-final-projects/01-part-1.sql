-- Step 1: Select all data from the 'customers' table
-- This query fetches all columns and rows from the 'classicmodels.customers' table, 
-- which contains information about customers such as customer number, name, contact information, etc.
SELECT * FROM classicmodels.customers;

-- Step 2: Select specific columns from the 'customers' table
-- Here, we're fetching specific columns: customerNumber, customerName, contactLastName, 
-- contactFirstName, phone, country, and creditLimit from the 'classicmodels.customers' table. 
-- These fields give us key details about customers, including their contact info and credit limits.
Select customerNumber, customerName, contactLastName, contactFirstName, phone, country, creditLimit
from classicmodels.customers;

-- Step 3: Create a new database named 'analysis'
-- This command creates a new database named 'analysis', which will be used to store a custom table 
-- containing basic customer information for future analysis or queries.
CREATE DATABASE analysis;

-- Step 4: Create a new table 'customerbasicinfo' in the 'analysis' database
-- We create a new table named 'customerbasicinfo' within the 'analysis' database. 
-- This table will store a simplified version of customer data, which includes only selected columns 
-- such as customer number, customer name, contact information, phone number, country, and credit limit.
-- The 'AS' keyword is used to populate this new table with the result of a query selecting the 
-- desired columns from 'classicmodels.customers'.
CREATE TABLE analysis.customerbasicinfo
as
Select customerNumber, customerName, contactLastName, contactFirstName, phone, country, creditLimit
from classicmodels.customers;
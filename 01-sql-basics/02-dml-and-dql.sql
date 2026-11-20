-- This script demonstrates the use of DDL (Data Definition Language) and DQL (Data Query Language) commands.

-- Data Definition Language (DDL)
-- DDL is used to define and manage the structure of the database.

-- Step 1: Creating a database
-- Creating a new database named "company"
CREATE DATABASE company;

-- Step 2: Using the database
-- Selecting the "company" database for further operations
USE company;

-- Step 3: Creating a table
-- Creating a table "employees" to store employee data
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier, automatically increments
    name VARCHAR(100) NOT NULL,         -- Employee name, required field
    position VARCHAR(50),               -- Employee position
    salary DECIMAL(10, 2)               -- Employee salary
);

-- Step 4: Altering the table structure
-- Modifying the structure of the "employees" table by adding a new column "hire_date"
ALTER TABLE employees
ADD hire_date DATE;  -- Adding a column to store the hire date of the employee

-- Step 5: Creating an index
-- Creating an index for faster searches by employee name
CREATE INDEX idx_name ON employees (name);

-- Step 6: Dropping an index
-- Removing the previously created index "idx_name"
DROP INDEX idx_name ON employees;

-- Step 7: Dropping a table
-- Dropping the "employees" table and all its data
DROP TABLE employees;

-- Step 8: Dropping a database
-- Dropping the "company" database along with all its contents
DROP DATABASE company;

-- Data Query Language (DQL)
-- DQL is responsible for retrieving data from the database.

-- Step 1: Using the database
-- Selecting the "company" database for operations
USE company;

-- Step 2: Querying all data from a table
-- Retrieving all data from the "employees" table
SELECT * FROM employees;

-- Step 3: Querying specific columns
-- Retrieving only the name and salary columns from the "employees" table
SELECT name, salary FROM employees;

-- Step 4: Filtering data using WHERE
-- Retrieving data for employees with a salary greater than 50000
SELECT name, position, salary
FROM employees
WHERE salary > 50000;

-- Step 5: Sorting results
-- Retrieving data sorted by salary in descending order
SELECT name, position, salary
FROM employees
ORDER BY salary DESC;

-- Step 6: Using JOIN to combine data from multiple tables
-- Assuming there is a "departments" table, combining employee data with department data
SELECT e.name, e.position, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- Step 7: Aggregating data
-- Calculating the average salary of all employees
SELECT AVG(salary) AS average_salary FROM employees;

-- Step 8: Grouping data
-- Calculating the average salary for each position
SELECT position, AVG(salary) AS average_salary
FROM employees
GROUP BY position;

-- Key differences between DML and DQL:
-- DML is used to modify data in the database (insertion, updating, deletion), whereas DQL is exclusively used for retrieving data.
-- DML operations modify the data in the database and may require transaction control (through COMMIT or ROLLBACK), while DQL typically does not require transaction control, as data retrieval does not alter the database state.

-- Summary
-- DML: Includes commands INSERT, UPDATE, DELETE, MERGE and is used for manipulating data in the database.
-- DQL: Includes the SELECT command and is used for retrieving data from the database.
-- DML and DQL are important components of SQL, and understanding them is necessary for working with data in relational databases. Practice with these commands to better understand their application and capabilities.
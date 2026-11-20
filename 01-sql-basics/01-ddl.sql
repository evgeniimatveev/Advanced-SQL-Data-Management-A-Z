-- DDL (Data Definition Language)
-- ===================================
-- DDL stands for Data Definition Language.
-- It is a subset of SQL commands used to define, modify, and manage the structure of database objects.
-- The primary DDL commands are CREATE, ALTER, DROP, and TRUNCATE.
-- ===================================

-- Step 1: Create a new database called Demo_1
-- The CREATE DATABASE command is used to create a new database.
CREATE DATABASE Demo_1;

-- Step 2: Use the newly created database
-- The USE command switches the current database context to Demo_1.
USE Demo_1;

-- Step 3: Create a table called Employee
-- The CREATE TABLE command creates a new table with specified columns.
-- This table will initially have three columns: empid, empname, and empsel.
CREATE TABLE Employee(
    empid INT,            -- Employee ID: Integer data type
    empname VARCHAR(70),  -- Employee Name: Variable character data type, max length 70
    empsel INT            -- Employee Salary: Integer data type
);

-- Step 4: Alter the table Employee
-- The ALTER TABLE command is used to modify the structure of an existing table.
-- In this case, we're adding a new column called DOB (Date of Birth) with a DATE data type.
ALTER TABLE Employee 
ADD DOB DATE;

-- Step 5: Drop the table Employee
-- The DROP TABLE command is used to delete an entire table and all its data.
-- After running this command, the Employee table and all its data will be permanently removed.
DROP TABLE Employee;

-- Notes:
-- 1. The CREATE DATABASE command defines a new database, which is a crucial part of DDL.
-- 2. The CREATE TABLE command defines a new table structure with columns and their data types.
-- 3. The ALTER TABLE command allows for modifications to the table structure after its initial creation.
-- 4. The DROP TABLE command deletes an entire table along with all of its data.
-- 5. DDL commands do not manipulate the data itself but rather define the structure that will hold the data.
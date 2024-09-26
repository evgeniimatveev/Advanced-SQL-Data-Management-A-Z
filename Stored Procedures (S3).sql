                              # Stored Procedures
-- Step 1: Use the 'classicmodels' database to ensure we are working in the correct context
USE classicmodels;

-- Step 2: Create a table 'PlatinumCustomer'
-- This table will store information about platinum customers (high-value customers).
-- It contains two fields: 'name1' for the customer's name and 'phone' for their phone number.
CREATE TABLE PlatinumCustomer(
    name1 VARCHAR(100),  -- The name of the platinum customer
    phone VARCHAR(100)   -- The phone number of the platinum customer
);

-- Explanation:
-- 1. CREATE TABLE PlatinumCustomer: This creates a new table called 'PlatinumCustomer' with two columns.
-- 2. VARCHAR(100): This specifies that the columns will store variable-length strings, up to 100 characters long.

-------------------------------------------------------------

-- Step 3: Define the DELIMITER for the procedure
-- MySQL uses the semicolon (;) by default to indicate the end of a statement.
-- Since stored procedures contain multiple SQL statements, we need to change the delimiter temporarily.
-- In this case, we change it to '$$' to avoid confusion when defining the procedure.
DELIMITER $$

-- Step 4: Create a stored procedure called 'InserData'
-- This stored procedure will insert customer data into the 'PlatinumCustomer' table.
-- It takes one input parameter 'custnumber', which specifies the customer number of the customer to insert.
CREATE PROCEDURE InserData(IN custnumber INT)  -- Stored procedure takes a customer number as input (custnumber)
BEGIN
    -- Step 5: Insert the customer's name and phone number into the 'PlatinumCustomer' table
    -- The procedure selects the 'customerName' and 'phone' from the 'customers' table for the given 'custnumber'.
    -- The data is then inserted into the 'PlatinumCustomer' table.
    INSERT INTO PlatinumCustomer (name1, phone)  -- Insert into the PlatinumCustomer table
    SELECT customerName, phone                   -- Select the name and phone number of the customer
    FROM customers                               -- From the 'customers' table
    WHERE customerNumber = custnumber;           -- Only select the customer whose 'customerNumber' matches the input 'custnumber'
END $$  -- End of the procedure definition

-- Explanation:
-- 1. CREATE PROCEDURE InserData: This defines a stored procedure named 'InserData' that accepts an input parameter 'custnumber' (the customer's number).
-- 2. BEGIN...END: The procedure starts with BEGIN and ends with END. All SQL statements between these keywords belong to the procedure.
-- 3. INSERT INTO PlatinumCustomer: This inserts data into the 'PlatinumCustomer' table.
-- 4. SELECT customerName, phone: This selects the customer's name and phone from the 'customers' table, based on the provided 'custnumber' parameter.
-- 5. WHERE customerNumber = custnumber: This ensures that only the customer with the matching 'customerNumber' is selected.

-------------------------------------------------------------

-- Step 6: Reset the DELIMITER back to semicolon (;)
-- After defining the stored procedure, we need to reset the delimiter back to the default semicolon (;).
DELIMITER ;

-------------------------------------------------------------

-- Step 7: Call the stored procedure to insert data for a specific customer
-- Here, we call the stored procedure 'InserData' with the input parameter '112', which corresponds to a customerNumber.
-- This will insert the name and phone of the customer with customerNumber 112 into the 'PlatinumCustomer' table.
CALL InserData(112);

-- Explanation:
-- 1. CALL InserData(112): This calls the 'InserData' procedure and passes the customer number '112' as the input parameter.
--    The procedure will insert the customer's name and phone number from the 'customers' table into the 'PlatinumCustomer' table.
                              
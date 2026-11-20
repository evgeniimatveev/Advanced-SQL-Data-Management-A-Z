-- Step 1: Selecting all records from the 'analysis.customerbasicinfo' table
-- This SELECT statement retrieves all the records from the 'customerbasicinfo' table.
-- It's often used as a preliminary check before proceeding with data operations.
SELECT * FROM analysis.customerbasicinfo;

-- Step 2: Dropping existing tables to avoid conflicts
-- The 'truncate' statement removes all data from the table 'customerfm', but keeps the table structure.
-- The 'drop table' command deletes both the table data and structure.
-- These commands are used to ensure that the table is either emptied or fully deleted before re-creating it.
TRUNCATE analysis.customerfm;   -- Clears the table but keeps the structure
DROP TABLE analysis.customerfm; -- Deletes the table completely

-- Step 3: Creating a new table 'customerfm' for RFM analysis (Recency, Frequency, Monetary value)
-- The 'CREATE TABLE' statement creates a new table called 'customerfm'.
-- This table will store the calculated metrics for each customer, including their last purchase date, order frequency, and monetary value.
CREATE TABLE analysis.customerfm AS
SELECT 
    customerNumber,                                           -- The customer number
    MAX(O.orderDate) AS lastPurchaseDate,                     -- The most recent order date (Recency)
    COUNT(O.orderNumber) AS FREQUENCY,                        -- The number of orders made by the customer (Frequency)
    SUM(od.quantityOrdered * od.priceEach) AS Monetary        -- The total amount spent by the customer (Monetary value)
FROM classicmodels.orders AS O                                -- Using 'orders' table as the main source
JOIN classicmodels.orderdetails AS od                         -- Joining 'orderdetails' table for quantity and price details
ON O.orderNumber = od.orderNumber                             -- Joining on 'orderNumber', which is present in both tables
GROUP BY customerNumber;                                      -- Grouping results by customer number to aggregate the data

-- Explanation:
-- This part of the query performs an RFM analysis:
-- 1. 'MAX(O.orderDate)' retrieves the latest order date, representing the most recent activity (Recency).
-- 2. 'COUNT(O.orderNumber)' calculates how many orders each customer has placed (Frequency).
-- 3. 'SUM(od.quantityOrdered * od.priceEach)' calculates the total monetary value each customer has spent (Monetary).

-- Step 4: Altering the 'customerfm' table to add a new column 'recency'
-- The 'ALTER TABLE' command is used to modify the structure of an existing table.
-- Here, we are adding a new column called 'recency', which will store the number of days since the customer's last purchase.
ALTER TABLE analysis.customerfm
ADD recency INT;

-- Explanation:
-- The 'ALTER TABLE' statement allows you to modify the table's structure.
-- In this case, we are adding a new integer column 'recency', which will be calculated in the next step.

-- Step 5: Updating the 'recency' column with calculated values
-- The 'UPDATE' statement modifies the existing rows in a table.
-- Here, we calculate the 'recency' value as the difference in days between the current date and the customer's last purchase date.
UPDATE analysis.customerfm
SET recency = DATEDIFF(CURRENT_DATE(), lastPurchaseDate);

-- Explanation:
-- The 'DATEDIFF(CURRENT_DATE(), lastPurchaseDate)' function calculates the number of days between today and the last purchase date for each customer.
-- The result is stored in the 'recency' column, giving us a measure of how recently the customer has made a purchase.

-- Step 6: Creating another table for additional customer metrics
-- Here, we create a new table called 'customeradditionalmetrics' to store other metrics, such as average order value and average quantity per order.
CREATE TABLE analysis.customeradditionalmetrics AS
SELECT 
    customerNumber,                                                -- The customer number
    AVG(od.quantityOrdered * od.priceEach) AS AVERAGEOrderValue,   -- The average value of each order (total price)
    AVG(od.quantityOrdered) AS AVERAGEOrderQUANTITY                -- The average quantity of items per order
FROM classicmodels.orders AS O                                     -- Using 'orders' as the main table
JOIN classicmodels.orderdetails AS od                              -- Joining 'orderdetails' to get item quantities and prices
ON O.orderNumber = od.orderNumber                                  -- Joining on the 'orderNumber'
GROUP BY customerNumber;                                           -- Grouping by customer number to calculate averages

-- Explanation:
-- 1. 'AVG(od.quantityOrdered * od.priceEach)' calculates the average value of each order (total amount spent per order).
-- 2. 'AVG(od.quantityOrdered)' calculates the average number of items purchased per order.
-- The result is stored in the 'customeradditionalmetrics' table, giving us further insights into each customer's purchasing behavior.



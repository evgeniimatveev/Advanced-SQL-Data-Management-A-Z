-- Step 1: Select customer number, minimum payment amount, and maximum payment amount
-- Here, we are using the `SELECT` statement to retrieve specific columns from the database.
-- The `customerNumber` column identifies each customer uniquely.
-- The `MIN(amount)` function returns the smallest payment made by each customer.
-- The `MAX(amount)` function returns the largest payment made by each customer.
-- Aliases (`AS "minimum_amount"`, `AS "Maximum_amount"`) make the result easier to read
-- by renaming the output columns to something more meaningful.
SELECT customerNumber, 
       MIN(amount) AS "minimum_amount",  -- Finds the minimum payment amount for each customer
       MAX(amount) AS "Maximum_amount"   -- Finds the maximum payment amount for each customer

-- Step 2: Specify the table from which to select data
-- The `FROM` clause tells the database which table to query data from.
-- Here, we are selecting data from the `payments` table in the `classicmodels` schema.
FROM classicmodels.payments

-- Step 3: Group the results by customer number
-- The `GROUP BY` clause is essential when using aggregate functions (like `MIN` and `MAX`).
-- It groups rows that have the same `customerNumber` value, so that the aggregate functions 
-- can be applied to each group individually.
GROUP BY customerNumber;



                                            
-- Step 4: Combine multiple filters in the `HAVING` clause
-- In this query, we filter customers who have made at least one payment over 5000 
-- AND whose total payments exceed 20000.
SELECT customerNumber, 
       MIN(amount) AS "minimum_amount",    -- Minimum payment made by the customer
       MAX(amount) AS "Maximum_amount",    -- Maximum payment made by the customer
       SUM(amount) AS "total_payments",    -- Total amount paid by the customer
       AVG(amount) AS "average_payment"    -- Average payment amount by the customer

-- Table containing the payment data
FROM classicmodels.payments

-- Group by customer number
GROUP BY customerNumber

-- Apply two conditions in the `HAVING` clause
HAVING MAX(amount) > 5000                -- Only include customers with a max payment greater than 5000
AND SUM(amount) > 20000;                 -- And customers whose total payments exceed 20000                                             
                                          # Window Functions 

USE classicmodels;  -- Step 1: Select the database to work with

-- Step 2: RANK() - Rank customers by credit limit within their country
-- The RANK() function assigns a rank to each customer in the same country, based on their credit limit.
-- If two customers have the same credit limit, they will receive the same rank, but the next rank will be skipped.
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    RANK() OVER (PARTITION BY country      -- Rank customers within each country
                 ORDER BY creditLimit DESC) AS "RANKINGINCOUNTRY"  -- Rank by credit limit (highest to lowest)
FROM classicmodels.customers;

-- Explanation of RANK():
-- 1. PARTITION BY country: This divides the result set into partitions based on the country.
--    The RANK() function will operate separately on each partition (country).
-- 2. ORDER BY creditLimit DESC: This sorts the customers in each country by their credit limit, from highest to lowest.
-- 3. RANK(): This assigns a rank to each row in the partition, starting from 1.
--    If multiple customers have the same credit limit, they will receive the same rank, and the next rank will be skipped (e.g., if two customers have rank 1, the next rank will be 3).

-------------------------------------------------------------

-- Step 3: ROW_NUMBER() - Assign a unique row number to each customer
-- The ROW_NUMBER() function is similar to RANK(), but it guarantees that each row gets a unique number.
-- Even if two customers have the same credit limit, they will get different row numbers.
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    ROW_NUMBER() OVER (PARTITION BY country 
                      ORDER BY creditLimit DESC) AS "ROWNUMBERINCOUNTRY"
FROM classicmodels.customers;

-- Explanation of ROW_NUMBER():
-- 1. PARTITION BY country: This divides the rows into partitions by country.
-- 2. ORDER BY creditLimit DESC: This sorts the customers in each partition by their credit limit in descending order.
-- 3. ROW_NUMBER(): This function assigns a unique sequential number to each row within a partition, starting from 1.
--    Unlike RANK(), ROW_NUMBER() guarantees that each row has a unique number, even if there are ties in the data.

-------------------------------------------------------------

-- Step 4: DENSE_RANK() - Rank customers without gaps in the ranking
-- DENSE_RANK() works like RANK(), but does not skip ranks.
-- If two customers have the same credit limit, they get the same rank, but the next rank is consecutive (no gaps).
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    DENSE_RANK() OVER (PARTITION BY country 
                      ORDER BY creditLimit DESC) AS "DENSERANKINCOUNTRY"
FROM classicmodels.customers;

-- Explanation of DENSE_RANK():
-- 1. PARTITION BY country: Divides the data by country, so that DENSE_RANK() works within each country.
-- 2. ORDER BY creditLimit DESC: Sorts customers in each country by credit limit, from highest to lowest.
-- 3. DENSE_RANK(): Similar to RANK(), but does not leave gaps in the ranking sequence.
--    If two customers share the same rank, the next rank will be consecutive (e.g., rank 1, 1, 2 instead of rank 1, 1, 3).

-------------------------------------------------------------

-- Step 5: AVG() - Calculate moving average of credit limits
-- The AVG() function can be used as a window function to calculate moving averages.
-- Here, we calculate the average credit limit for each customer, including the current customer and the two customers before them.
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    AVG(creditLimit) OVER (PARTITION BY country 
                           ORDER BY creditLimit 
                           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS "MOVINGAVERAGE"
FROM classicmodels.customers;

-- Explanation of AVG() OVER():
-- 1. PARTITION BY country: Divides the rows by country, so that the moving average is calculated within each country.
-- 2. ORDER BY creditLimit: Orders the rows in each partition by credit limit (ascending order by default).
-- 3. ROWS BETWEEN 2 PRECEDING AND CURRENT ROW: Defines a "window frame" that includes the current row and the two preceding rows.
--    The average is calculated based on these three rows.

-------------------------------------------------------------

-- Step 6: LAG() and LEAD() - Compare credit limits with the previous and next customers
-- LAG() allows you to access data from the previous row, and LEAD() allows you to access data from the next row.
-- This query compares each customer's credit limit with the previous and next customers in the same country.
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    LAG(creditLimit, 1) OVER (PARTITION BY country 
                              ORDER BY creditLimit DESC) AS "PREVIOUS_CREDITLIMIT",  -- Credit limit of the previous customer
    LEAD(creditLimit, 1) OVER (PARTITION BY country 
                               ORDER BY creditLimit DESC) AS "NEXT_CREDITLIMIT"      -- Credit limit of the next customer
FROM classicmodels.customers;

-- Explanation of LAG() and LEAD():
-- 1. LAG(creditLimit, 1): Fetches the credit limit of the previous row (customer) in the same partition (country).
--    The second argument (1) specifies that we look one row before the current row.
-- 2. LEAD(creditLimit, 1): Fetches the credit limit of the next row (customer) in the same partition (country).
--    The second argument (1) specifies that we look one row after the current row.
-- 3. These functions are useful for comparing values across rows without needing to use self-joins.

-------------------------------------------------------------

-- Step 7: SUM() and COUNT() - Calculate cumulative sum and total number of customers
-- SUM() and COUNT() are standard aggregate functions, but when used with OVER(), they can calculate running totals and counts.
-- This query calculates the cumulative sum of credit limits and the total number of customers in each country.
SELECT 
    customerName,                          -- Customer's name
    customerNumber,                        -- Unique customer number (ID)
    country,                               -- Customer's country
    creditLimit,                           -- Customer's credit limit
    SUM(creditLimit) OVER (PARTITION BY country 
                           ORDER BY creditLimit DESC) AS "CUMULATIVECREDITLIMIT",  -- Cumulative credit limit
    COUNT(customerNumber) OVER (PARTITION BY country) AS "TOTALCUSTOMERSINCOUNTRY" -- Total number of customers in the country
FROM classicmodels.customers;

-- Explanation of SUM() and COUNT() OVER():
-- 1. SUM(creditLimit) OVER(): Calculates a running total of credit limits for customers in each country.
--    As we move through each row, the sum of the current and all preceding rows is returned.
-- 2. COUNT(customerNumber) OVER(): Counts the total number of customers in each country.
--    Since there is no ORDER BY, the count is the same for all rows in the same partition (country).

-------------------------------------------------------------
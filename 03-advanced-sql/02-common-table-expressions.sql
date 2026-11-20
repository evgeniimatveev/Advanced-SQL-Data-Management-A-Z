-- Step 1: Use the 'classicmodels' database to ensure we are working with the correct data
USE classicmodels;

-- Step 2: Define a Common Table Expression (CTE) called 'RANKTABLE'
-- This CTE ranks customers by their credit limit within each country
WITH RANKTABLE AS (
    SELECT 
        customerName,                       -- Customer's name
        customerNumber,                     -- Unique customer number (ID)
        country,                            -- Customer's country
        creditLimit,                        -- Customer's credit limit
        RANK() OVER (PARTITION BY country   -- Rank customers within their country
                     ORDER BY creditLimit DESC) AS "RANKINGINCOUNTRY"  -- Rank by credit limit (highest to lowest)
    FROM classicmodels.customers
)

-- Explanation of the CTE:
-- 1. WITH RANKTABLE: This creates a Common Table Expression (CTE) called 'RANKTABLE' that we will refer to later in the query.
-- 2. RANK() OVER (PARTITION BY country): This ranks customers by their credit limit within each country. The rank resets for each country.
-- 3. ORDER BY creditLimit DESC: Ranks the customers by their credit limit, from highest to lowest.

-- Step 3: Retrieve data from the payments table and join it with the ranked customers from the CTE
SELECT *
FROM payments AS P                               -- Get all columns from the payments table
JOIN RANKTABLE AS R                              -- Join the payments table with the CTE (ranked customers)
ON P.customerNumber = R.customerNumber;          -- Join on the 'customerNumber' column, which is common to both tables

-- Explanation of the JOIN:
-- 1. SELECT * FROM payments: Retrieves all the payment data.
-- 2. JOIN RANKTABLE: Combines the payments data with the ranked customer data from the CTE.
-- 3. ON P.customerNumber = R.customerNumber: The JOIN condition ensures that we match customers based on their customer number.

-- Result:
-- The result will show each payment alongside the customer's rank within their country, as determined by the CTE.
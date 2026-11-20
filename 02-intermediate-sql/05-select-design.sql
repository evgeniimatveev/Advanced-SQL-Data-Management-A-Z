                        #             SELECT query design
-- Step 1: Use the 'classicmodels' schema
-- Before running any queries, we need to make sure we are using the correct database schema.
USE classicmodels;

-- Step 2: Select the required columns (customer name, country, total payments)
-- We are selecting customerName, country, and the total sum of payments made by each customer.
-- The SUM() function calculates the total amount from the 'amount' column for each customer.
SELECT 
    customerName,                      -- Name of the customer
    country,                           -- Customer's country
    SUM(amount) AS TotalAmount         -- The total sum of payments for the customer (aliased as 'TotalAmount')

-- Step 3: Join the 'customers' and 'payments' tables
-- We use the JOIN clause to combine data from the 'customers' and 'payments' tables.
-- The ON clause specifies that we join the tables on the 'customerNumber' column, which is common to both tables.
FROM customers
JOIN payments 
ON customers.customerNumber = payments.customerNumber

-- Explanation of JOIN:
-- The JOIN operation is used to combine rows from two or more tables based on a related column between them.
-- In this case, we join 'customers' and 'payments' using the 'customerNumber' column.
-- This ensures that we only get data for customers who have made payments.

-- Step 4: Filter customers from the USA using the WHERE clause
-- The WHERE clause filters the rows to include only customers from the USA.
WHERE country = 'USA'

-- Explanation of WHERE:
-- The WHERE clause is used to filter rows before any grouping or aggregation takes place.
-- In this case, we are filtering the result set to show only customers whose country is 'USA'.

-- Step 5: Group the results by customer name and country using GROUP BY
-- We use the GROUP BY clause to group the results by 'customerName' and 'country'.
-- This allows us to apply aggregate functions like SUM() to each group separately.
GROUP BY customerName, country

-- Explanation of GROUP BY:
-- The GROUP BY clause is used to group rows that have the same values in specified columns.
-- Here, we group by both 'customerName' and 'country' to calculate the total amount of payments for each customer.
-- Without GROUP BY, we wouldn't be able to apply the SUM() function correctly.

-- Step 6: Filter groups where the total payments exceed 5000 using HAVING
-- The HAVING clause filters the grouped results based on the total amount of payments.
-- We only include customers whose total payments exceed 5000.
HAVING TotalAmount > 5000

-- Explanation of HAVING:
-- HAVING is similar to WHERE, but it works after the rows are grouped.
-- We use it to filter the groups that meet a condition based on the result of an aggregate function (like SUM()).
-- In this case, we filter out customers whose total payments are 5000 or less.

-- Step 7: Sort the results by total amount in descending order using ORDER BY
-- We use the ORDER BY clause to sort the results by the 'TotalAmount' column in descending order.
-- This ensures that customers with the highest total payments appear first.
ORDER BY TotalAmount DESC

-- Explanation of ORDER BY:
-- The ORDER BY clause is used to sort the result set based on one or more columns.
-- In this case, we sort the results by the total amount of payments in descending order (DESC),
-- so that customers who have spent the most money are listed at the top.

-- Step 8: Limit the result set to the top 5 customers using LIMIT
-- We use the LIMIT clause to restrict the number of rows returned to 5.
-- This means we only get the top 5 customers with the highest total payments.
LIMIT 5;

-- Explanation of LIMIT:
-- The LIMIT clause restricts the number of rows returned by the query.
-- In this case, we only want to see the top 5 customers, so we limit the results to 5 rows.
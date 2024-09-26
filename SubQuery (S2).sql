                                           # SubQuery
-- Step 1: Selecting customer name and phone number from the 'customers' table
-- We are retrieving customer details such as `customerName` and `phone` from the `customers` table.
-- This query will return the customers who have placed at least one order.
-- To do this, we use a subquery to find customers who are present in the `orders` table.
SELECT customerName, phone   -- Selecting customer name and phone number
FROM classicmodels.customers -- From the 'customers' table

-- Step 2: Use of a subquery to filter customers who have placed orders
-- The `WHERE` clause is used to filter customers based on their presence in the `orders` table.
-- We are using an `IN` condition combined with a subquery.
-- The subquery retrieves the list of distinct `customerNumber` values from the `orders` table.
-- This way, we only select customers who have placed an order.
WHERE customerNumber IN ( 
      SELECT DISTINCT customerNumber    -- Subquery: selecting distinct customer numbers from the 'orders' table
      FROM classicmodels.orders         -- From the 'orders' table
);
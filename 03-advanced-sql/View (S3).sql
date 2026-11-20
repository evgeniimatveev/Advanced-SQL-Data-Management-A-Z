                              # Views
-- Step 1: Create a view named 'OrderByCustomer'
-- A view is a virtual table that provides a simplified interface to the result of a query.
-- In this case, we create a view that calculates the total quantity of products ordered by each customer.
CREATE VIEW OrderByCustomer AS
SELECT 
    c.customerName,                        -- Customer's name
    SUM(od.quantityOrdered) AS TotalOrders -- Sum of the total quantity ordered by the customer
FROM customers AS c                        -- From the 'customers' table (aliased as 'c')
JOIN orders AS o                           -- Joining the 'orders' table (aliased as 'o')
ON c.customerNumber = o.customerNumber      -- Matching customers to their orders by 'customerNumber'
JOIN orderdetails AS od                    -- Joining the 'orderdetails' table to access product quantities
ON o.orderNumber = od.orderNumber           -- Matching orders to order details by 'orderNumber'
GROUP BY c.customerName;                   -- Grouping by customer name to calculate total orders per customer

-- Explanation:
-- 1. CREATE VIEW OrderByCustomer: This creates a view named 'OrderByCustomer'. A view is a saved query that behaves like a table.
--    Once created, you can query the view just like a normal table.
-- 2. SUM(od.quantityOrdered): This is an aggregate function that calculates the total number of products ordered by each customer.
-- 3. JOIN orders ON c.customerNumber = o.customerNumber: Joins the 'customers' table with the 'orders' table on the 'customerNumber' column, ensuring we are linking each customer with their respective orders.
-- 4. JOIN orderdetails ON o.orderNumber = od.orderNumber: Joins the 'orders' table with 'orderdetails' to get detailed information about each order (such as product quantities).
-- 5. GROUP BY c.customerName: This groups the results by customer name, so that the `SUM()` function applies to each customer separately, giving us the total quantity of products ordered by each customer.

-- The resulting view 'OrderByCustomer' can now be queried like a normal table.

-- Step 1: Selecting the product code and the sum of ordered quantities
-- Here, we use the `SELECT` statement to specify the columns we want to retrieve.
-- We are retrieving the `productCode` column and the sum of the `quantityOrdered` column for each product.
-- The `SUM()` function is used to calculate the total quantity of items ordered for each product.
-- We use an alias `AS total_quantity` to rename the resulting sum column to something more descriptive.
SELECT productCode, SUM(quantityOrdered) AS total_quantity

-- Step 2: Specifying the data source (the table)
-- The `FROM` clause specifies the table from which we are selecting the data.
-- In this case, we are selecting from the `orderdetails` table, which is part of the `classicmodels` schema.
FROM classicmodels.orderdetails

-- Step 3: Grouping data by product code
-- The `GROUP BY` clause is used to group rows that have the same value in the `productCode` column.
-- This ensures that all the orders for the same product are grouped together so we can calculate the total quantity ordered for each product.
GROUP BY productCode;

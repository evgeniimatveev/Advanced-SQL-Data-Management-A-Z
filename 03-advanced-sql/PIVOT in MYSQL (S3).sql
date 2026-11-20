-- Step 1: Use the 'classicmodels' database
USE classicmodels;

-- Step 2: Select sales data by product code and split the sales into separate columns for 2003, 2004, and 2005
SELECT productCode,
    -- Use CASE WHEN to split sales by year into separate columns
    -- CASE WHEN checks if the condition (OrderYear = 2003) is true.
    -- If true, it returns TotalSales. If false, it returns 0.
    SUM(CASE WHEN OrderYear = 2003 THEN TotalSales ELSE 0 END) AS Sales_2003,  -- Sales for 2003
    SUM(CASE WHEN OrderYear = 2004 THEN TotalSales ELSE 0 END) AS Sales_2004,  -- Sales for 2004
    SUM(CASE WHEN OrderYear = 2005 THEN TotalSales ELSE 0 END) AS Sales_2005   -- Sales for 2005
FROM (
    -- Step 3: Subquery to calculate total sales by product and year
    SELECT 
        productCode,                       -- Product code (identifier for the product)
        YEAR(OrderDate) AS OrderYear,      -- Extract the year from 'OrderDate' for grouping by year
        SUM(quantityOrdered * priceEach) AS TotalSales  -- Total sales = quantity ordered * price for each product
    FROM orders                            -- Select data from the 'orders' table
    JOIN orderdetails                      -- Join with 'orderdetails' to get product details (quantity and price)
    USING (orderNumber)                    -- Use the 'orderNumber' to join the two tables
    GROUP BY productCode, OrderYear        -- Group by both product code and order year to calculate yearly sales per product
) yearsales                                -- Alias the subquery as 'yearsales'
GROUP BY productCode;                      -- Group by product code in the outer query to pivot the data by year

-- Explanation of Pivot and CASE WHEN:
-- 1. The outer query uses SUM() with CASE WHEN to transform or pivot the sales data into separate columns for each year.
-- 2. CASE WHEN syntax: 
--    - CASE WHEN <condition> THEN <result> ELSE <alternative_result> END
--    - It checks whether the condition is true. If true, it returns the value specified after THEN. 
--      Otherwise, it returns the value after ELSE.
--    - In this query: CASE WHEN OrderYear = 2003 THEN TotalSales ELSE 0 END means:
--      If the order is from 2003, it returns the total sales for that year. If not, it returns 0.
-- 3. SUM() aggregates the results:
--    - SUM() adds up all values returned by the CASE WHEN expressions. 
--      This way, we calculate total sales per product for each year.
-- 4. GROUP BY in the outer query:
--    - GROUP BY productCode ensures that we aggregate sales for each product into separate columns for each year (2003, 2004, 2005).

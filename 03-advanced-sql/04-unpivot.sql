                         # UNPIVOT in SQL 

-- Step 1: Switch to the 'classicmodels' database
-- The USE statement sets the default database for the session. 
-- All subsequent queries will run in the context of this database unless explicitly specified otherwise.
USE classicmodels;

-- Step 2: Create a new table 'SALES_SUMMARY' to store sales data by year.
-- The CREATE TABLE statement is used to create a new table in the database.
-- In this case, we are creating 'SALES_SUMMARY', which will hold product sales split by years 2003, 2004, and 2005.

CREATE TABLE SALES_SUMMARY AS
-- Step 3: Select sales data by product code and split the sales into separate columns for 2003, 2004, and 2005
-- We're selecting data from an existing table and creating a new table with the results.
-- The SELECT statement pulls product sales data for 2003, 2004, and 2005.

SELECT productCode,  -- Product code (identifier for each product)
    -- Use CASE WHEN to split sales by year into separate columns
    -- CASE WHEN checks if the condition (OrderYear = 2003) is true.
    -- If true, it returns TotalSales. If false, it returns 0.
    SUM(CASE WHEN OrderYear = 2003 THEN TotalSales ELSE 0 END) AS Sales_2003,  -- Sales for the year 2003
    SUM(CASE WHEN OrderYear = 2004 THEN TotalSales ELSE 0 END) AS Sales_2004,  -- Sales for the year 2004
    SUM(CASE WHEN OrderYear = 2005 THEN TotalSales ELSE 0 END) AS Sales_2005   -- Sales for the year 2005
FROM (
    -- Step 4: Subquery to calculate total sales by product and year
    -- This subquery calculates total sales for each product grouped by year.
    SELECT 
        productCode,                   -- Product code (identifier for each product)
        YEAR(OrderDate) AS OrderYear,  -- Extract the year from 'OrderDate' for grouping by year
        SUM(quantityOrdered * priceEach) AS TotalSales  -- Total sales = quantity ordered * price for each product
    FROM orders                        -- Select data from the 'orders' table
    JOIN orderdetails                  -- Join with 'orderdetails' to get product details (quantity and price)
    USING (orderNumber)                -- Use the 'orderNumber' to join the two tables
    GROUP BY productCode, OrderYear    -- Group by both product code and order year to calculate yearly sales per product
) yearsales                            -- Alias the subquery as 'yearsales'
GROUP BY productCode;                  -- Group by product code in the outer query to pivot the data by year

-- Explanation of each step:
-- 1. USE: The USE command sets the database context for subsequent operations. All commands after this will use the 'classicmodels' database.
-- 2. CREATE TABLE AS: This creates a new table called 'SALES_SUMMARY'. The 'AS' keyword allows you to fill the new table with the result of a SELECT statement.
-- 3. SELECT productCode, SUM(CASE WHEN...): The SELECT statement pulls data from a subquery. We use CASE WHEN to split the sales into columns for each year.
-- 4. The subquery calculates total sales by product and year, and the outer query pivots this data into separate columns for each year.
-- 5. GROUP BY ensures that the aggregation (SUM) is done for each product code, creating one row per product in the final table.

#                            -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

-- Step 1: View the contents of the 'sales_summary' table
-- The 'sales_summary' table contains sales for the years 2003, 2004, and 2005 in separate columns.
-- We will later unpivot this data using UNION ALL to transform these columns into rows.
SELECT * FROM classicmodels.sales_summary;

-- Step 2: Unpivot the data using UNION ALL
-- We will use UNION ALL to combine the sales data from 2003, 2004, and 2005 into a single column 'TotalSales'.
-- Additionally, we'll create a column 'OrderYear' to indicate the year of the sales.

-- Part 1: Select sales for the year 2003
SELECT 
    productCode,                     -- The product code (unique identifier for each product)
    '2003' AS OrderYear,             -- Hardcoding the year 2003 as a constant for this part of the unpivot
    sales_2003 AS TotalSales         -- Selecting sales for the year 2003 from the 'sales_summary' table
FROM classicmodels.sales_summary     -- Data source: the 'sales_summary' table
WHERE sales_2003 > 0                 -- Optional: Filter out rows where sales for 2003 are 0
UNION ALL                           -- Use UNION ALL to combine this with the next SELECT query

-- Part 2: Select sales for the year 2004
SELECT 
    productCode,                     -- The same product code column
    '2004' AS OrderYear,             -- Hardcoding the year 2004 as a constant for this part
    sales_2004 AS TotalSales         -- Selecting sales for the year 2004
FROM classicmodels.sales_summary     -- Data source: the 'sales_summary' table
WHERE sales_2004 > 0                 -- Optional: Filter out rows where sales for 2004 are 0
UNION ALL                           -- Use UNION ALL to combine this with the next SELECT query

-- Part 3: Select sales for the year 2005
SELECT 
    productCode,                     -- The same product code column
    '2005' AS OrderYear,             -- Hardcoding the year 2005 as a constant for this part
    sales_2005 AS TotalSales         -- Selecting sales for the year 2005
FROM classicmodels.sales_summary     -- Data source: the 'sales_summary' table
WHERE sales_2005 > 0;                -- Optional: Filter out rows where sales for 2005 are 0

-- Explanation of Key Concepts:

-- 1. UNION ALL: 
--    We use UNION ALL to combine the results of multiple SELECT statements. This combines the results without removing duplicate rows. 
--    This is essential when unpivoting data, as each SELECT represents data for a different year (2003, 2004, and 2005), 
--    and we need to keep each row for its corresponding year.

-- 2. SELECT with Hardcoded Year:
--    In each part of the query, we hardcode the year ('2003', '2004', '2005') as a new column 'OrderYear'. 
--    This is necessary because we're unpivoting sales columns for each year into a single 'TotalSales' column.
--    The hardcoded year values allow us to keep track of which year the sales data corresponds to.

-- 3. WHERE Clauses (Optional):
--    The WHERE clause filters out rows where sales for a particular year are 0. This is optional but useful for excluding rows with no sales data.
--    By using 'WHERE sales_2003 > 0', we ensure that only products with sales in 2003 are included. The same applies for 2004 and 2005.

-- 4. Result Structure:
--    After running this query, we will have a result set with three columns:
--    - 'productCode': the unique product identifier
--    - 'OrderYear': the year of the sales (either 2003, 2004, or 2005)
--    - 'TotalSales': the total sales amount for the product in that year

-- Example Output:
-- After running this query, your result set might look like this:
-- +-------------+-----------+------------+
-- | productCode | OrderYear | TotalSales |
-- +-------------+-----------+------------+
-- | S18_1749    | 2003      | 54561.50   |
-- | S18_1749    | 2004      | 58143.40   |
-- | S18_1749    | 2005      | 27830.70   |
-- | S18_2248    | 2003      | 507.52     |
-- | S18_2248    | 2004      | 31092.23   |
-- | S18_2248    | 2005      | 1233.27    |
-- +-------------+-----------+------------+

-- By unpivoting the data in this way, you have transformed the columns for different years into rows, making the data easier to analyze.
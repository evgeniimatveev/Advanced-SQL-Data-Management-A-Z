-- # FINAL PROJECT (part 3)
-- Last part - preparation for Machine Learning (ML)

-- Step 1: Create a new table for additional customer metrics.
-- This table will store information about the average order value and average order quantity per customer.
CREATE TABLE analysis.customeradditionalmetrics AS
SELECT
    customerNumber,  -- The unique identifier for each customer
    AVG(od.quantityOrdered * od.priceEach) AS AVERAGEOrderValue,  -- The average value of each order (total price of ordered items)
    AVG(od.quantityOrdered) AS AVERAGEOrderQUANTITY  -- The average quantity of items per order
FROM classicmodels.orders AS O  -- Using the 'orders' table as the main source of data
JOIN classicmodels.orderdetails AS od  -- Joining 'orderdetails' to get item quantities and prices
ON O.orderNumber = od.orderNumber  -- Joining 'orders' and 'orderdetails' using the 'orderNumber'
GROUP BY customerNumber;  -- Grouping the result by customer number to get the average per customer

-- Step 2: Create a new table to calculate sales metrics based on product lines.
-- In this table, we will calculate total sales for each customer based on different product categories (e.g., 'Classic Cars', 'Motorcycles', etc.).
-- We use the CASE WHEN statement to sum the sales for each category.
CREATE TABLE analysis.customerproductlines AS
SELECT
    customerNumber,  -- The customer number
    SUM(CASE WHEN productLine = 'CLASSIC CARS'  -- When the product line is 'CLASSIC CARS', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS CLASSIC_Cars_Sales,  -- Calculating sales for 'Classic Cars'
    SUM(CASE WHEN productLine = 'MOTORCYCLES'  -- When the product line is 'MOTORCYCLES', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS MOTORCYCLES_Sales,  -- Calculating sales for 'Motorcycles'
    SUM(CASE WHEN productLine = 'PLANES'  -- When the product line is 'PLANES', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS PLANES_Sales,  -- Calculating sales for 'Planes'
    SUM(CASE WHEN productLine = 'SHIPS'  -- When the product line is 'SHIPS', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS SHIPS_Sales,  -- Calculating sales for 'Ships'
    SUM(CASE WHEN productLine = 'TRAINS'  -- When the product line is 'TRAINS', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS TRAINS_Sales,  -- Calculating sales for 'Trains'
    SUM(CASE WHEN productLine = 'Vintage Cars'  -- When the product line is 'Vintage Cars', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS Vintage_Cars_Sales,  -- Calculating sales for 'Vintage Cars'
    SUM(CASE WHEN productLine = 'Trucks and Buses'  -- When the product line is 'Trucks and Buses', sum the sales
        THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS Trucks_and_Buses_Sales  -- Calculating sales for 'Trucks and Buses'
FROM classicmodels.orders AS O  -- Using 'orders' as the base table
JOIN classicmodels.orderdetails AS od  -- Joining 'orderdetails' to get item quantities and prices
ON O.orderNumber = od.orderNumber  -- Joining 'orders' and 'orderdetails' using the 'orderNumber'
JOIN classicmodels.products AS p  -- Joining the 'products' table to get product lines
ON od.productCode = p.productCode  -- Matching 'productCode' between 'orderdetails' and 'products'
GROUP BY customerNumber;  -- Grouping by 'customerNumber' to calculate sales metrics for each customer

-- Step 3: Check all distinct product lines.
-- This is useful to verify if all product categories are included in the previous table. If there are more categories, we can add them to the table.
SELECT DISTINCT productLine  -- Selects all unique product lines from the 'products' table
FROM classicmodels.products;


			                              # Query optimization techniques

-- Step 1: Use the 'classicmodels' database.
-- This sets the current working database to 'classicmodels'. 
-- All subsequent queries will be executed within this database context.
USE classicmodels;

-- Step 2: Basic SELECT query with LIMIT.
-- Fetches the first 10 rows from the 'customers' table.
-- Using LIMIT is essential when selecting large datasets to avoid excessive resource usage.
-- It restricts the number of rows returned, which is useful for pagination and previewing data.
SELECT * FROM classicmodels.customers
LIMIT 10;  -- Always use LIMIT to avoid large data retrieval when not needed

-- Step 3: Improved SELECT query by specifying columns.
-- This query selects only specific columns ('customerName' and 'customerNumber') instead of '*'.
-- It's a better practice to select only the columns you need because it reduces the amount of data being processed.
-- Avoiding SELECT * makes your query more efficient, as fewer columns are returned.
SELECT customerName, customerNumber
FROM classicmodels.customers
LIMIT 7;  -- Again, we limit the result to 7 rows for better performance

-- Step 4: Measuring query execution time.
-- We are using NOW() to capture the start time and end time of query execution.
-- This helps in determining how long the query takes to run.
SET @start_time = NOW();  -- Capturing the start time of the query

-- INSERT YOUR QUERY HERE
-- Replace this line with the query you want to measure the execution time for

SET @end_time = NOW();  -- Capturing the end time of the query

-- Calculate the execution time in seconds.
-- TIMESTAMPDIFF function is used to calculate the difference between the start and end times.
SELECT TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS execution_time;

-- Step 5: Measuring time in microseconds and milliseconds.
-- The TIMESTAMPDIFF function can also be used to measure time differences in smaller units.
-- Here we measure execution time in microseconds and milliseconds for higher precision.
SELECT TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time) AS execution_time_in_microseconds;
SELECT TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time) / 1000 AS execution_time_in_milliseconds;  -- Dividing by 1000 to get milliseconds

-- Step 6: Measuring execution time for a specific query.
-- We repeat the process, this time for a SELECT query that retrieves customer data.
-- This query is optimized by selecting specific columns and limiting the number of rows returned.
SET @start_time = NOW();  -- Start timing the query

SELECT customerName, customerNumber
FROM classicmodels.customers
LIMIT 10;  -- Limiting the result to the first 10 rows

SET @end_time = NOW();  -- End timing the query

-- Step 7: Calculating execution time in seconds.
-- After the query execution, we calculate the time difference to see how long it took to run.
SELECT TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS execution_time;

-- Step 8: Query optimization: Filtering results using WHERE and LIKE.
-- In this query, we use a WHERE clause to filter customers whose names start with 'A'.
-- The LIKE operator is used for pattern matching (A% means names starting with 'A').
-- ORDER BY is used to sort results by 'customerNumber' in descending order.
SELECT customerNumber, customerName
FROM classicmodels.customers
WHERE customerName LIKE 'A%'  -- Filtering customer names that start with 'A'
ORDER BY customerNumber DESC  -- Sorting the result by customerNumber in descending order
LIMIT 1000;  -- Limiting the result to 1000 rows to improve performance on large datasets

-- Step 9: Using JOIN to combine data from multiple tables.
-- This query joins the 'orders' table with the 'customers' table based on the 'customerNumber' field.
-- JOIN operations can be expensive, so optimizing them (e.g., ensuring indexes on join columns) is important.
-- Always join tables on indexed columns (like customerNumber here) for better performance.
SELECT *
FROM orders AS O
JOIN customers AS C
ON O.customerNumber = C.customerNumber;  -- Joining orders with customers using customerNumber as the key

-- Step 10: EXISTS vs. IN for subqueries.
-- When choosing between EXISTS and IN, it's generally better to use EXISTS for checking the existence of records.
-- EXISTS is typically more efficient, especially for larger datasets, as it can stop searching as soon as it finds a match.
-- IN retrieves and compares all values, which can be slower.
-- This section suggests the use of EXISTS over IN for performance reasons.
-- The exact query would depend on your use case, but the point is: prefer EXISTS for performance.
EXISTS / IN  -- Prefer EXISTS over IN when checking for the existence of rows in a subquery

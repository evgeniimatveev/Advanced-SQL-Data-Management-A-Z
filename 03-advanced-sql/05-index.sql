                                      # INDEX in SQL

-- Step 1: Use the 'classicmodels' database.
-- The USE command sets the context for all subsequent operations to be executed within the 'classicmodels' database.
-- This ensures that any operations such as SELECT, CREATE, etc., are run on this specific database.
USE classicmodels;

-- Step 2: View all the data from the 'customers' table.
-- This query selects all columns from the 'customers' table to get an overview of its contents.
-- This will display all customer data such as customer numbers, names, phone numbers, addresses, etc.
SELECT * FROM classicmodels.customers;

-- Step 3: Create a unique index on the 'customerName' column.
-- A unique index ensures that the values in the indexed column are unique across all rows.
-- This is useful for columns like 'customerName', where each customer should have a unique name.
-- If there are duplicate customer names, this will raise an error.
-- Indexes help improve the speed of data retrieval operations, especially for large datasets.
Create Unique Index idx_cus_name on customers(customerName);

-- Step 4: Create a composite index on 'customerName' and 'phone' columns.
-- A composite index is an index on two or more columns.
-- It helps improve performance when queries filter on multiple columns, in this case, both 'customerName' and 'phone'.
-- This is useful when searching for records based on a combination of these two fields.
-- For example, if you frequently run queries to find customers based on both their name and phone number, this index will speed up those queries.
Create Index idx_cus_name_composite on customers(customerName, phone);

-- Step 5: Explain the execution plan for a query.
-- The EXPLAIN keyword provides information about how MySQL executes a SELECT query.
-- It helps in understanding the efficiency of the query and whether indexes are being used to speed up the data retrieval process.
-- In this case, we want to check how MySQL will retrieve data from the 'customers' table when searching for a specific customer.
-- The goal is to see if the index created on 'customerName' is used.
Explain select *
FROM customers
WHERE customerName = 'La Rochelle Gifts';

-- Explanation of the EXPLAIN Output:
-- In the output below, we can see:
-- - 'possible_keys': This shows the indexes that could be used for this query. Here, it shows 'idx_cus_name' and 'idx_cus_name_composite', meaning either of these could be used to speed up the query.
-- - 'key': This shows the index that was actually used. In this case, it's 'idx_cus_name', which means MySQL used the index on 'customerName' to execute the query.
-- - 'rows': This tells us the number of rows that MySQL thinks it needs to scan to find the matching records. Since we are filtering on a unique value ('customerName'), it only needs to scan 1 row, which is very efficient.
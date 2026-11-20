- # Final project: Data preparation for machine learning
-- This query creates a final table that consolidates customer information and various metrics
-- related to purchase behavior, product preferences, and transaction history.
-- The final table is essential for building machine learning models that predict customer behavior.

-- Step 1: Specify the schema we are using (analysis schema)
USE analysis;

-- Step 2: Create the final table for machine learning.
-- We are combining multiple tables with relevant metrics to create a comprehensive dataset for analysis.
-- The final table includes customer basic information, RFM (Recency, Frequency, Monetary) metrics, 
-- average order values, and sales metrics for specific product lines.
CREATE TABLE analysis.FINAL_TABLE_FOR_MACHINE_LEARNING AS

-- Step 3: Select all columns from the 'customerbasicinfo' table (CF).
-- This table contains basic information about the customer, such as name, phone number, and address.
SELECT CF.*,

-- Step 4: Include key RFM metrics from the 'customerRFM' table (RFM).
-- These metrics capture the recency (how recently the customer made a purchase), frequency (how often the customer buys), 
-- and monetary value (total spent by the customer).
RFM.recency,              -- Recency: the number of days since the last purchase.
RFM.FREQUENCY,            -- Frequency: the total number of purchases made by the customer.
RFM.MoneTory,             -- Monetary: total amount spent by the customer across all purchases.

-- Step 5: Add metrics from the 'customeradditionalmetrics' table (AMC).
-- This table calculates the average order value and average quantity ordered per transaction for each customer.
AMC.AVERAGEOrderVA lue,   -- Average Order Value: the average monetary value of each order.
AMC.AVERAGEOrderQUANTITY, -- Average Order Quantity: the average quantity of items ordered per order.

-- Step 6: Include product sales metrics from the 'customerproductlines' table (CPL).
-- These metrics represent the total sales for different product categories such as classic cars, motorcycles, planes, etc.
-- The sales data is calculated by summing the total number of products ordered by the customer for each category.
CPL.CLASSIC_Cars_Sales,   -- Total sales for the 'Classic Cars' product line.
CPL.MOTORCYCLES_Sales,    -- Total sales for the 'Motorcycles' product line.
CPL.PLANES_Sales,         -- Total sales for the 'Planes' product line.
CPL.SHIPS_Sales,          -- Total sales for the 'Ships' product line.
CPL.TRAINS_Sales,         -- Total sales for the 'Trains' product line.
CPL.Vintage_Cars_Sales,   -- Total sales for the 'Vintage Cars' product line.
CPL.Trucks_and_Buses_Sales -- Total sales for the 'Trucks and Buses' product line.

-- Step 7: Specify the tables from which the data will be joined.
-- The final table is built by joining four main tables: 'customerbasicinfo' (CF), 'customerRFM' (RFM),
-- 'customeradditionalmetrics' (AMC), and 'customerproductlines' (CPL). 
-- These tables contain the necessary features for machine learning, such as customer demographics, purchasing behavior,
-- and product preferences.

-- Step 8: Use LEFT JOINs to combine all the tables based on the customerNumber (primary key).
-- LEFT JOIN ensures that even if a customer doesn't have data in some of the joined tables, their basic info is still included.
FROM customerbasicinfo AS CF  -- This is the main table, containing basic customer details.
LEFT JOIN customerrfm AS RFM   -- Joining the 'customerrfm' table to get RFM metrics.
ON CF.customerNumber = RFM.customerNumber  -- Joining on the 'customerNumber' column.

LEFT JOIN customeradditionalmetrics AS AMC  -- Joining the 'customeradditionalmetrics' table to get average order metrics.
ON CF.customerNumber = AMC.customerNumber  -- Joining on the 'customerNumber' column.

LEFT JOIN customerproductlines AS CPL  -- Joining the 'customerproductlines' table to get sales metrics for different product categories.
ON CF.customerNumber = CPL.customerNumber;  -- Joining on the 'customerNumber' column.
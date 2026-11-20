/*
  advanced_aggregation_demo.sql

  Goal:
  - Show a compact but advanced aggregation pattern:
    * CTE
    * GROUP BY with multiple metrics
    * HAVING filter
    * window function (RANK) over the aggregated results
*/

-- (added so the demo runs on its own: a throw-away table with 600 generated orders)
CREATE DATABASE IF NOT EXISTS aggregation_demo;
USE aggregation_demo;

DROP TABLE IF EXISTS sales_orders;
CREATE TABLE sales_orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    order_amount DECIMAL(10, 2),
    region       VARCHAR(10)
);

INSERT INTO sales_orders
WITH RECURSIVE n AS (
    SELECT 1 AS i
    UNION ALL
    SELECT i + 1 FROM n WHERE i < 600
)
SELECT i,
       1 + (i % 12),
       DATE_ADD('2023-01-01', INTERVAL (i * 7) % 700 DAY),
       ROUND(20 + (i * 37) % 480, 2),
       ELT(1 + (i % 3), 'North', 'South', 'West')
FROM n;

-- 1. Example dataset (you can adapt to your own schema)
--    Assume you have a table like this in your database:
--      sales_orders(order_id, customer_id, order_date, order_amount, region)

-- 2. Aggregate sales by customer and region, per year
WITH customer_yearly_sales AS (
    SELECT
        customer_id,
        region,
        EXTRACT(YEAR FROM order_date) AS order_year,
        COUNT(*)               AS total_orders,
        SUM(order_amount)      AS total_revenue,
        AVG(order_amount)      AS avg_order_value
    FROM sales_orders
    GROUP BY
        customer_id,
        region,
        EXTRACT(YEAR FROM order_date)
),

-- 3. Rank customers within each region & year by total revenue
ranked_customers AS (
    SELECT
        customer_id,
        region,
        order_year,
        total_orders,
        total_revenue,
        avg_order_value,
        RANK() OVER (
            PARTITION BY region, order_year
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM customer_yearly_sales
)

-- 4. Final result:
--    - Top 5 customers per region & year
--    - Only customers with at least 10 orders
SELECT
    region,
    order_year,
    customer_id,
    total_orders,
    total_revenue,
    avg_order_value,
    revenue_rank
FROM ranked_customers
WHERE
    revenue_rank <= 5
    AND total_orders >= 10
ORDER BY
    region,
    order_year,
    revenue_rank;

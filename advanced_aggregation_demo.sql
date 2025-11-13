/*
  advanced_aggregation_demo.sql

  Goal:
  - Show a compact but advanced aggregation pattern:
    * CTE
    * GROUP BY with multiple metrics
    * HAVING filter
    * window function (RANK) over the aggregated results
*/

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

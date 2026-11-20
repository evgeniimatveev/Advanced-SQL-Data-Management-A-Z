use classicmodels;
CREATE TABLE salessummary AS
SELECT productCode,
SUM(CASE WHEN orderYear = 2003 THEN totalsales ELSE 0 END)
AS Sales_2003,
SUM(CASE WHEN orderYear = 2004 THEN totalsales ELSE 0 END)
AS Sales_2004,
SUM(CASE WHEN orderYear = 2005 THEN totalsales ELSE 0 END)
AS Sales_2005 FROM
(SELECT
productCode, YEAR(OrderDate) AS orderYear,
SUM(quantityOrdered * priceEach) AS totalsales
FROM orders
JOIN orderdetails
USING (orderNumber)
GROUP BY productCode, orderYear) yearlysales
GROUP BY productCode;

SELECT * FROM classicmodels.salessummary;

SELECT productCode, '2003' AS OrderYear,
Sales_2003 AS totalSales
FROM classicmodels.salessummary
UNION ALL
SELECT productCode, '2004' AS OrderYear,
Sales_2004 AS totalSales
FROM classicmodels.salessummary
UNION ALL
SELECT productCode, '2005' AS OrderYear,
Sales_2005 AS totalSales
FROM classicmodels.salessummary;

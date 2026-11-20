USE classicmodels;

SELECT customerName,country,SUM(amount) as TotalAmount
FROM customers
JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE country = 'USA'
GROUP BY customerName,country
HAVING TotalAmount > 5000
ORDER BY TotalAmount desc
LIMIT 5;

SELECT * FROM classicmodels.customers
where contactFirstName REGEXP 'NA$'; 

SELECT * FROM classicmodels.customers
where phone REGEXP '^91'; 

SELECT * FROM classicmodels.products
where productCode regexp '^S.*[8-9]$';
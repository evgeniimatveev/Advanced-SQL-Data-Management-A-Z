SELECT * FROM classicmodels.orderdetails;

#group by example
SELECT productCode, sum(quantityOrdered)
from classicmodels.orderdetails
GROUP BY productCode;

#subquery example
SELECT customerName,phone 
FROM classicmodels.customers
where customerNumber IN 
(select DISTINCT customerNumber
FROM classicmodels.orders);

#mathematical function example
SELECT customerNumber,max(amount) as "maximum_amount",
min(amount) as "minimum_amount"
FROM classicmodels.payments
GROUP BY customerNumber;

select CONCAT(contactFirstName, ' ',contactLastName)
as "Full_Name"
FROM customers;

select max(length(contactFirstName))
FROM customers;

select TRIM(contactFirstName)
FROM customers;




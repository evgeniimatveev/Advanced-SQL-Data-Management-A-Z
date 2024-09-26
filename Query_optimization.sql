SELECT customerName,customerNumber 
FROM classicmodels.customers
LIMIT 5;

SET @start_time = NOW();
SELECT customerName,customerNumber 
FROM classicmodels.customers
LIMIT 5;
SET @end_time = NOW();
SELECT timestampdiff(MICROSECOND,@start_time,@end_time);


select * from 
orders o, customers c
where o.customerNumber = c.customerNumber;


select * from 
orders o
JOIN
customers c
ON o.customerNumber = c.customerNumber;

#EXISTS/IN
#choose exists dont choose IN




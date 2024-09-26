
WITH RankTable AS
(select customerName,customerNumber,
country,creditLimit,
RANK() 
OVER (PARTITION BY country order by creditLimit desc)
as "RankInCountry"
from 
customers)

SELECT * FROM payments
JOIN RankTable 
on payments.customerNumber = RankTable.customerNumber;

CREATE VIEW OrderbyCustomer AS
select C.customerName,SUM(OD.quantityOrdered)
from customers C
JOIN orders O ON
C.customerNumber = O.customerNumber
join orderdetails OD
ON O.orderNumber = OD.orderNumber
GROUP BY C.customerName;

SELECT * FROM OrderbyCustomer;

CREATE table platinumcustomer(
Name1 varchar(100),
phone varchar(100)
);

DELIMITER $$

CREATE PROCEDURE InsertData(IN custnumber INT)
BEGIN
	INSERT INTO platinumcustomer
    SELECT customerName,phone FROM customers
    WHERE customerNumber = custnumber;
END $$

DELIMITER ;

CALL InsertData(112);

SELECT * FROM customers;









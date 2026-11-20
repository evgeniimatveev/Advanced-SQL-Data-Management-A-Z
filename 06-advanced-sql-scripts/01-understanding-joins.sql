CREATE TABLE amandemodb.customer(
CustomerId INT primary KEY,
CustomerName Varchar(200),
Gender Varchar(10)
);

CREATE TABLE amandemodb.SalesOrder(
OderID INT,
CustomerId INT,
DateofOrder date
);

INSERT INTO amandemodb.customer
values (1, "Aman", "Male");

INSERT INTO amandemodb.customer
values (2, "Kumar", "Male");

INSERT INTO amandemodb.customer
values (3, "John", "Male");

INSERT INTO amandemodb.SalesOrder
values (11, 1, "2024-05-14");

INSERT INTO amandemodb.SalesOrder
values (12, 1, "2024-05-15");

INSERT INTO amandemodb.SalesOrder
values (13, 4, "2024-05-15");

select * from amandemodb.customer;

select * from amandemodb.SalesOrder;

use amandemodb; 

SELECT * FROM customer C 
inner join salesorder SO
ON c.CustomerId = SO.CustomerId;

SELECT * FROM customer C 
left join salesorder SO
ON c.CustomerId = SO.CustomerId
UNION
SELECT * FROM customer C 
right join salesorder SO
ON c.CustomerId = SO.CustomerId;


USE classicmodels;
select count(*) from customers c
left join payments p
on C.customerNumber = p.customerNumber;
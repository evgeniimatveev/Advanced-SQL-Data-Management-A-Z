USE classicmodels;

#1
INSERT INTO payments
VALUES (103,'AHBRWE54','2004-07-08',3456);

#2
UPDATE customers
SET phone = 7654321
WHERE customerNumber = 103;

#3
SELECT * FROM classicmodels.orderdetails
WHERE orderNumber = 10100;

#4
SELECT count(*) FROM classicmodels.products
where buyPrice > 50;

#5
UPDATE products
SET buyPrice = buyPrice*1.1
WHERE productCode = 'S10_1678';








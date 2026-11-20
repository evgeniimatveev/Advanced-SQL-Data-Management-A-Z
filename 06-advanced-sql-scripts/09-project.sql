SET sql_safe_updates=0;
SELECT * FROM classicmodels.customers;

SELECT customerName,
customerNumber,contactFirstName,
contactLastName,phone,country,creditLimit
FROM classicmodels.customers;

CREATE DATABASE analysis;

#part1
CREATE TABLE analysis.CustomerBasicInfo
AS
SELECT customerName,
customerNumber,contactFirstName,
contactLastName,phone,country,creditLimit
FROM classicmodels.customers;

#part 2
CREATE TABLE analysis.customerrfm AS
select customerNumber,
MAX(O.OrderDate) as lastpurchasedate,
COUNT(O.orderNumber) as frequency,
SUM(OD.quantityOrdered * OD.PriceEach) as monetory
from classicmodels.orders O
JOIN classicmodels.orderdetails OD
on O.orderNumber = OD.orderNumber
GROUP BY customerNumber;

ALTER TABLE analysis.customerrfm 
ADD recency INT;

UPDATE analysis.customerrfm 
SET recency = datediff(CURDATE(),lastpurchasedate);


create table analysis.customeradditionalmetric AS
select customerNumber,
AVG(OD.quantityOrdered * OD.PriceEach) AS averageordervalue,
AVG(OD.quantityOrdered) AS averageorderquantity
from classicmodels.orders O
JOIN classicmodels.orderdetails OD
on O.orderNumber = OD.orderNumber
GROUP BY customerNumber;


#part3
CREATE TABLE analysis.Customerproductlines
SELECT customerNumber,
SUM(CASE WHEN productLine = 'Classic Cars' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS classiccarsales,
SUM(CASE WHEN productLine = 'Motorcycles' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS MotorcyclesSales,
SUM(CASE WHEN productLine = 'Planes' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS PlanesSales,
SUM(CASE WHEN productLine = 'Ships' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS Shipssales,
SUM(CASE WHEN productLine = 'Trains' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS Trainssales,
SUM(CASE WHEN productLine = 'Trucks and Buses' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS TrucksandBusessales,
SUM(CASE WHEN productLine = 'Vintage Cars' 
THEN OD.quantityOrdered * OD.PriceEach ELSE 0 END)
AS VintageCarssales
FROM 
classicmodels.orders O
JOIN classicmodels.orderdetails OD
on O.orderNumber = OD.orderNumber
JOIN classicmodels.products P
ON P.productCode = OD.productCode
GROUP BY customerNumber;

#DROP TABLE analysis.Customerproductlines;

USE analysis;
#prepare final data
CREATE TABLE analysis.Finaltableformachinelearning
SELECT cf.*,
rfm.frequency,rfm.monetory,rfm.recency,
amc.averageordervalue,amc.averageorderquantity,
cpl.VintageCarssales,cpl.TrucksandBusessales,
cpl.Trainssales,cpl.Shipssales,cpl.Planessales,cpl.MotorcyclesSales,
cpl.classiccarsales
from CUSTOMERBASICINFO cf
LEFT JOIN customerrfm rfm
on cf.customerNumber = rfm.customerNumber
LEFT JOIN customeradditionalmetric amc
on cf.customerNumber = amc.customerNumber
LEFT JOIN customerproductlines cpl
on cf.customerNumber = cpl.customerNumber;


















SELECT * FROM classicmodels.customers;

CREATE UNIQUE INDEX idx_cus_name ON customers(customerName);

CREATE INDEX idx_cus_name_composite ON customers(customerName,phone);

EXPLAIN SELECT * FROM customers 
WHERE customerName = 'La Rochelle Gifts';
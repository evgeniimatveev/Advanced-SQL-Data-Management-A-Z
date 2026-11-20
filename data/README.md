# 📂 Data

| File | What it is |
|---|---|
| [`classicmodels.sql`](classicmodels.sql) | A MySQL dump that creates and fills the **`classicmodels`** sample database: a retailer of scale-model cars, with customers, orders, payments, employees and offices |

Load it once (this creates the database `classicmodels`):

```bash
mysql -u root -p < data/classicmodels.sql
```

| Table | Rows |
|---|--:|
| `customers` | 122 |
| `orders` | 326 |
| `orderdetails` | 2,996 |
| `products` | 110 |
| `productlines` | 7 |
| `payments` | 273 |
| `employees` | 23 |
| `offices` | 7 |

The tables are linked by 8 foreign keys:

```
customers.salesRepEmployeeNumber  ->  employees
employees.officeCode  ->  offices
employees.reportsTo  ->  employees
orderdetails.orderNumber  ->  orders
orderdetails.productCode  ->  products
orders.customerNumber  ->  customers
payments.customerNumber  ->  customers
products.productLine  ->  productlines
```

---

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

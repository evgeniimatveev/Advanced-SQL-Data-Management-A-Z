# 🚀 Section 3: Advanced SQL

Window functions, CTEs, pivoting and unpivoting, indexes, query optimization, views and stored procedures, all on `classicmodels`.

> Load [`data/classicmodels.sql`](../data/classicmodels.sql) first (it creates the `classicmodels` database), then run the scripts in order in MySQL Workbench or the `mysql` client. ↩️ = builds on an earlier script · 🔤 = depends on case-insensitive table names (see the main README) · ℹ️ = lecture-style script

| # | Script | What it covers | Notes |
|:-:|--------|----------------|-------|
| 1 | [`01-window-functions.sql`](01-window-functions.sql) | Window functions: `RANK()`, `ROW_NUMBER()` and friends, e.g. credit limit rank within a country |  |
| 2 | [`02-common-table-expressions.sql`](02-common-table-expressions.sql) | Common table expressions (CTE) |  |
| 3 | [`03-pivot.sql`](03-pivot.sql) | Pivot: yearly sales per product as columns (`CASE WHEN`) |  |
| 4 | [`04-unpivot.sql`](04-unpivot.sql) | Unpivot: yearly columns back into rows | 🔤 creates `SALES_SUMMARY`, reads `sales_summary` (see limitations) |
| 5 | [`05-index.sql`](05-index.sql) | Indexes and how they speed queries up |  |
| 6 | [`06-query-optimization.sql`](06-query-optimization.sql) | Query optimization techniques |  |
| 7 | [`07-view.sql`](07-view.sql) | Views: the `OrderByCustomer` view |  |
| 8 | [`08-stored-procedures.sql`](08-stored-procedures.sql) | Stored procedures: inserting platinum customers, with `DELIMITER` |  |

---

[← Intermediate SQL](../02-intermediate-sql/) &nbsp;·&nbsp; [Employee Management Project →](../04-employee-management-project/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

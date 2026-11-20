# 🏁 Section 5: Final Projects

A customer-analytics project in four steps: from basic customer info to RFM metrics to one table ready for machine learning.

> Load [`data/classicmodels.sql`](../data/classicmodels.sql) first (it creates the `classicmodels` database), then run the scripts in order in MySQL Workbench or the `mysql` client. ↩️ = builds on an earlier script · 🔤 = depends on case-insensitive table names (see the main README) · ℹ️ = lecture-style script

| # | Script | What it covers | Notes |
|:-:|--------|----------------|-------|
| 1 | [`01-part-1.sql`](01-part-1.sql) | Create the `analysis` schema and `customerbasicinfo` |  |
| 2 | [`02-part-2.sql`](02-part-2.sql) | RFM table (recency, frequency, monetary) and additional metrics | ↩️ run `01` first |
| 3 | [`03-part-3.sql`](03-part-3.sql) | Additional metrics and product-line spending per customer | ↩️ run `01` and `02` first |
| 4 | [`04-data-prep-for-ml.sql`](04-data-prep-for-ml.sql) | Join everything into `FINAL_TABLE_FOR_MACHINE_LEARNING` | ↩️ run `01`–`03` first |

---

[← Employee Management Project](../04-employee-management-project/) &nbsp;·&nbsp; [Advanced SQL Scripts (original) →](../06-advanced-sql-scripts/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

# 🏢 Section 4: Employee Management Project

A database designed from scratch: create it, check the normal forms, practise DML on it, then add advanced features.

> Load [`data/classicmodels.sql`](../data/classicmodels.sql) first (it creates the `classicmodels` database), then run the scripts in order in MySQL Workbench or the `mysql` client. ↩️ = builds on an earlier script · 🔤 = depends on case-insensitive table names (see the main README) · ℹ️ = lecture-style script

| # | Script | What it covers | Notes |
|:-:|--------|----------------|-------|
| 1 | [`01-database.sql`](01-database.sql) | Create the `employee_management` database and its tables |  |
| 2 | [`02-check-normalization-forms.sql`](02-check-normalization-forms.sql) | Check 1NF, 2NF and 3NF with queries | ↩️ run `01` first |
| 3 | [`03-dml-practice-insert.sql`](03-dml-practice-insert.sql) | INSERT, UPDATE and DELETE practice, with updated phone numbers | ↩️ needs `01` and the tables of `04` |
| 4 | [`04-full-features.sql`](04-full-features.sql) | Stored procedures, roles and permissions, and more on top of the schema | ↩️ run `01` first |

---

[← Advanced SQL](../03-advanced-sql/) &nbsp;·&nbsp; [Final Projects →](../05-final-projects/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

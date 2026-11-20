# 🧱 Section 1: SQL Basics

The four families of SQL commands: define structures (DDL), change data (DML), query it (DQL) and control transactions and permissions (TCL, DCL).

> Load [`data/classicmodels.sql`](../data/classicmodels.sql) first (it creates the `classicmodels` database), then run the scripts in order in MySQL Workbench or the `mysql` client. ↩️ = builds on an earlier script · 🔤 = depends on case-insensitive table names (see the main README) · ℹ️ = lecture-style script

| # | Script | What it covers | Notes |
|:-:|--------|----------------|-------|
| 1 | [`01-ddl.sql`](01-ddl.sql) | DDL: create a database and a table, alter it, drop it |  |
| 2 | [`02-dml-and-dql.sql`](02-dml-and-dql.sql) | DDL and DQL walkthrough: tables, indexes, SELECT, WHERE, ORDER BY, JOIN, GROUP BY | ℹ️ lecture: the query examples at the end refer to tables the script dropped above |
| 3 | [`03-dml-and-dql-practice.sql`](03-dml-and-dql-practice.sql) | Practice: 50 INSERTs into `company.employees`, then DML and DQL exercises | ↩️ needs `company.employees` (the CREATE steps of `02`) |
| 4 | [`04-tcl-and-dcl.sql`](04-tcl-and-dcl.sql) | COMMIT, ROLLBACK, GRANT and REVOKE with example users | 🔐 creates MySQL users, needs an account with that privilege |

---

[← Quickstart](../00-quickstart/) &nbsp;·&nbsp; [Intermediate SQL →](../02-intermediate-sql/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

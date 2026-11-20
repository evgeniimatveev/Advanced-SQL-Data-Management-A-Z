# 🎯 Quickstart

One self-contained query that shows three ideas of the course in a single statement: a CTE, `GROUP BY` with several metrics, and a window function (`RANK()`) over the aggregated result.

```bash
mysql -u root -p < 00-quickstart/advanced_aggregation_demo.sql
```

| File | What it is |
|---|---|
| [`advanced_aggregation_demo.sql`](advanced_aggregation_demo.sql) | Creates a small throw-away table with 600 generated orders, then ranks the top customers per region and year |

---

[SQL Basics →](../01-sql-basics/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*

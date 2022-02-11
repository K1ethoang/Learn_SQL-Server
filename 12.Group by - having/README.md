# 1. Group By - Having
- having như where của select nhưng giành cho group by
- having là where của group by
- Xem code để hiểu rõ hơn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/12.Group%20by%20-%20having/group%20by%20-%20having.sql)

|Hình|
|:---:|
|![Group By - Having](https://github.com/K1ethoang/SQL-Server/blob/main/12.Group%20by%20-%20having/image/sql-group%20by-having.png)|

# 2. Syntax

```sql
SELECT <trường trong GROUP BY hoặc Aggregate Function> FROM TableA
-- WHERE <điều kiện> (có thể có hoặc không)
GROUP BY <trường cần group>
HAVING <điều kiện>
```

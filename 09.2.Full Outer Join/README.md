# Full Outer Join

- Trả về những dữ liệu thoả điều kiện và những dữ liệu không thoả dữ liệu (xem hình bên dưới).
- Mọi join đều cần có điều kiện.
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.2.Full%20Outer%20Join/full%20outer%20join.sql)
  <br>

![Full Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.2.Full%20Outer%20Join/sql-full-outer-join.png)

# Syntax

```SQL
SELECT <select_list>
FROM TableA A FULL OUTER JOIN TableB B
ON A.Key = B.Key
```

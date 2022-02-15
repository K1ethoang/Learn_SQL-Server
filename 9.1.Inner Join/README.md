# Inner Join
- Là kết hợp 2 bảng lại rồi lấy những trường thoả mãn điều kiện (xem hình bên dưới).
- Mọi join đều cần có điều kiện.
- [Code](inner%20join.sql)
<br>

![Inner Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.1.Inner%20Join/sql-inner-join.png)

# Syntax

```SQL
SELECT <select_list>
FROM TableA A INNER JOIN TableB B
ON A.Key = B.Key
```

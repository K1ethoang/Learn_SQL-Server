# 1. Union

- Gộp 2 bảng thành 1 bảng
- Record nào thiếu thì thôi, nếu giống thì chỉ lấy 1
- Có thể cho thêm điều kiện
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.4.Union/union.sql)
  <br>

![Full Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.4.Union/image/sql-union.png)

# 2. Syntax

```SQL
SELECT column_name(s) FROM tableA
UNION
SELECT column_name(s) FROM tableB;
```

# 1. 

- Dùng cho backup là chủ yếu
- Tạo ra 1 bảng mới từ 1 hoặc nhiều bảng có sẵn
- Có thể thêm điều kiện (WHERE)
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.5.Select%20Into/select%20into.sql)
  <br>

![Full Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.5.Select%20Into/image/sql-select-into.png)

# 2. Syntax
## 2.1. Bảng mới có dữ liệu
```SQL
SELECT <column_list> INTO <new_table_name>
FROM tableA
```
## 2.2. Bảng mới không có dữ liệu
```SQL
SELECT <column_list> INTO <new_table_name>
FROM tableA
WHERE <false_condition>
```
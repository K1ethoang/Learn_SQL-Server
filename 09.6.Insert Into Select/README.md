# 1. Insert Into Select
- Copy dữ liệu từ bảng có sẵn vào bảng đã tồn tại
- Các trường phải giống nhau mới copy được
- Có thể thêm điều kiện (WHERE)
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.6.Insert%20Into%20Select/insert%20into%20select.sql)
  <br>

# 2. Syntax
```SQL
INSERT INTO <bảng để copy dữ liệu qua>
SELECT <colum_list> FROM <bảng chứa dữ liệu để copy>
-- WHERE <điều kiện> (nếu có)
```

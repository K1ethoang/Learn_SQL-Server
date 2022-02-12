# 1. Cursor (con trỏ)
- **Tác dụng**: Khi có nhu cầu duyệt từng record của bảng, với mỗi record có kết quả xử lý riêng thì dùng cursor
- Nếu đã code C/C++ thì qua đây thì tư duy vẫn vậy, chỉ khác cú pháp
- Bên SQL gọi là Cursor thay vì Pointer 🍦
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/15.1.%20Cursor%20(T_SQL)/cursor.sql)
  
|Hình|
|:---:|
|![cursor](./image/SQL-Server-Cursor.png)|
# 2. Syntax
## Các bước như hình
## 1. Khai báo con trỏ
```sql
DECLARE <tên con trỏ> CURSOR
FOR <câu lệnh select>
```
## 2. Mở con trỏ
```sql
OPEN <tên con trỏ>
```

## 2. Mở con trỏ
```sql
FETCH NEXT FROM <tên con trỏ> INTO <danh sách biến>
```

```sql
WHILE @@FETCH_STATUS = 0  
    BEGIN
        <câu lệnh>
        FETCH NEXT FROM <tên con trỏ> INTO <danh sách biến>  -- tăng biến con trỏ (chuyển qua phần tử khác)
    END;

```

## 4. Đóng con trỏ
```sql
CLOSE <tên con trỏ>
```

## 5. Giải phóng
```sql
DEALLOCATE <tên con trỏ>
```

# 1. View
- Tác dụng: 
  - Không phải viết lại câu lệnh query
  - Máy chạy nhanh hơn vì đã biên dịch câu lệnh
  - Truyền câu lệnh lên server nhanh (vì nó gọn)
  - Bảo mật hơn
- Thông tin khác: 
  - View là bảng ảo
  - Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra sài
  - View được tạo từ 1 truy vấn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/14.View/view.sql)

|Hình|
|:---:|
|![view](https://github.com/K1ethoang/SQL-Server/blob/main/14.View/image/sql-view.png)|

# 2. Syntax

```sql
CREATE VIEW <view_name> AS
SELECT <column_list> From <table_name>
-- WHERE <condition> (có thể có hoặc không)
```

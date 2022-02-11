# 1. View
- View là bảng ảo
- Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra sài
- View được tạo từ 1 truy vấn
- Xem code để hiểu rõ hơn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/14.View/view.sql)

|Hình|
|:---:|
|![view](link)|

# 2. Syntax

```sql
CREATE VIEW <view_name> AS
SELECT <column_list> From <table_name>
-- WHERE <condition> (có thể có hoặc không)
```

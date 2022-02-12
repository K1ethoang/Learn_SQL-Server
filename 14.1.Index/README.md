# 1. Index
- Tác dụng: Tìm kiếm (Select) nhanh - như mục lục
- Có 2 dạng:
    - Clustered: sắp xếp theo thứ tự tăng dần
    - Non-Clustered: không sắp xếp theo thứ tự
- Không áp dụng cho:
  - Bảng có ít dữ liệu, bản ghi
  - Cột cập nhật thường xuyên (insert hoặc update)
  - Cột chứa nhiều giá trị rỗng (null)
- Thông tin khác:
  - Mỗi bảng chỉ có 1 Index Clustered
  - Cột là Primary key thường mặc định là Index Clustered
  - 1 bảng có thể chứa nhiều Index Non Clustered
  - Cột là Unique thường mặc định là Index Non-Clustered
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/14.1.Index/index.sql)

# 2. Syntax
## Create Index
``` sql
CREATE INDEX <index_name>
ON <table_name> (<column_list>)
```

## Drop Index
``` sql
DROP INDEX table_name.index_name;
```

## 2.1. Clustered Index
- Nếu trong bảng đã có primary key thì không thể tạo thêm clustered index
```sql
CREATE CLUSTERED INDEX <index_name>
ON <table_name> (<column_list>)
```
## 2.2. Clustered Index
```sql
CREATE NONCLUSTERED INDEX <index_name>
ON <table_name> (<column_list>)
```

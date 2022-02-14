# 1. Store Procedure
- **Thông tin**:
  - Là chương trình hay thủ tục
  - Ta có thể dùng Transact-SQL EXCUTE (EXEC) để thực thi các store procedure
  - Store procedure `khác` với các hàm xử lý là giá trị trả về của chúng
  - `Không` chứa trong tên và chúng không được sử dụng trực tiếp trong biểu thức
- **Lợi ích**
  - Động: có thể chỉnh sửa khối lệnh, tái sử dụng nhiều lần
  - Nhanh hơn: tự phân tích cú pháp cho tối ưu. Và tạo bản sao để lần chạy sau không cần thực thi lại từ đầu
  - Bảo mật: giới hạn quyền sử dụng cho user nào sử dụng user nào không
  - Giảm bandwidth (băng thông): với các transaction lớn. Vài dòng lệnh 1 lúc thì store sẽ đảm bảo
- [Code](store%20procedure.sql)
  
# 2. Syntax
## 2.1. Tạo
```sql
CREATE PROCEDURE <procedure_name>
[Parameter]
AS
<sql_statement>
GO;
```
## 2.2. Sử dụng
```sql
EXEC <procedure_name>
```
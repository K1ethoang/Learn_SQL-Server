# 1. Tìm kiếm gần đúng
- Xem code để hiểu rõ hơn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/9.0.T%C3%ACm%20ki%E1%BA%BFm%20g%E1%BA%A7n%20%C4%91%C3%BAng/t%C3%ACm%20ki%E1%BA%BFm%20g%E1%BA%A7n%20%C4%91ugns.sql)

# 2. Syntax
```sql
SELECT [tính chất] <danh sách column>
FROM <danh sách Table/Query>
WHERE <column> LIKE <dữ liệu mẫu>
```
### Trong đó:
`[tính chất]` có thể là một trong các từ khóa * (Lấy tất cả dữ liệu), DISTINCT (lấy dữ liệu không trùng lặp) , TOP<n> (lấy dữ liệu thứ n đầu tiên)

`<danh sách column>` tên các bảng cột cần hiển thị ở kết quả truy vấn

- Các column được ngăn cách với nhau bằng dấu phẩy (,)
- Có thể gán tên cho các column với cú pháp: `<tên Column>` AS `'Tên thay thế'`.
  <br>
  
`<danh sách table/query>` tên các bảng, nguồn để lấy dữ liệu khi truy vấn

- Các table được ngăn cách bằng dấu phẩy (,)
- Alias là bí danh (hay còn gọi là tên gọi tắt) của table dùng cho các table có tên quá dài, hoặc một table được dùng nhiều lần trong câu truy vấn. Có thể đặt Alias theo cú pháp: `<tên table>` AS `<tên Alias>`
  <br>
  
`<Dữ liệu mẫu>` đặt sau từ khóa `LIKE` dùng để đại diện gần chính xác cho một dữ liệu mẫu, thông qua hai ký tự `%` và `_`

- % Biểu thị một hoặc nhiều ký tự, hoặc thể hiện ký tự bằng 0.

- _  Biểu thị một ký tự đơn
  
 # 2. Một số dạng tìm kiếm gần đúng
  |Dạng tìm kiếm|Mệnh đề WHERE|
  |:---:|:---:|
  |Tìm kiếm dữ liệu bắt đầu bằng ký tự `K`|…WHERE `<column>` LIKE `‘K%’`|
  |Tìm kiếm dữ liệu kết thúc bằng ký tự `K`|…WHERE `<column>` LIKE `‘%K’`|
  |Tìm kiếm dữ liệu có chứa ký tự `Kt` ở vị trí bất kỳ|…WHERE `<column>` LIKE `‘%Kt%’`|
  |Tìm kiếm dữ liêu có ký tự `K` ở `vị trí thứ hai`|…WHERE `<column>` LIKE `‘%_K%’`|
  |Tìm kiếm dữ liệu bắt đầu bằng ký tự `K`, và có ít nhất có `chiều dài` là `3 ký tự`|…WHERE `<column>` LIKE `‘K_%_%’`|
  |Tìm kiếm dữ liệu `bắt đầu` bằng ký tự `K`, `kết thúc` bằng ký tự `m`|…WHERE `<column>` LIKE `‘K%m’`|

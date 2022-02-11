# 1. Auto Increament
- Xem code để hiểu rõ hơn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/13.Auto%20increament/auto%20increament.sql)

# 2. Syntax

```sql
CREATE TABLE <tên table>
(
	<tên trường> <kiểu dữ liệu> IDENTITY, 
	-- tự tăng trường này, phải là số
	-- Mặc định từ 1 và tăng 1 đơn vị
	<tên trường> <kiểu dữ liệu>
	...
)
```

USE HowKteam
GO

-- xuất ra thông tin gv tên bắt đầu bằng chữ l
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'l%' 

-- xuất ra thông tin gv kết thức bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%n'

-- xuất ra thông tin gv có tồn tại chữ m
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%m%'

-- xuất ra thông tin gv có tồn tại chữ ế
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'%ế%'
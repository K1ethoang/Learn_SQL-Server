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

-- Xuất ra thông tin giáo viên mà tên có tồn tại chữ iế và có độ dài ít nhất 4 ký tự
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'_%iế%_'

-- Xuất ra thông tin của giáo viên mà tên bắt đầu bằng chữ Tr và kết thúc bằng chữ ng
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'Tr%ng'

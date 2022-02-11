USE HowKteam
GO

SELECT * FROM dbo.GIAOVIEN

-- tạo ra 1 bảng lưu thông tin giáo viên, tên bộ môn và lương của gv đó
SELECT HOTEN,TENBM,LUONG INTO LuongGiaoVien FROM dbo.GIAOVIEN, dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

SELECT * FROM dbo.LuongGiaoVien

UPDATE dbo.GIAOVIEN SET LUONG = 88888
WHERE MAGV = '006'

SELECT * FROM dbo.GIAOVIEN

-- view là bảng ảo
-- cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra sài

-- tạo ra view từ 1 câu truy vấn
CREATE VIEW TestView AS
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM TestView

-- Update view
ALTER VIEW TestView AS
SELECT HOTEN FROM dbo.GIAOVIEN

-- tạo view có dấu
CREATE VIEW [view tiếng việt] AS
SELECT * FROM dbo.KHOA

SELECT * FROM [view tiếng việt]

-- xoá view
DROP VIEW TestView
DROP VIEW [view tiếng việt]
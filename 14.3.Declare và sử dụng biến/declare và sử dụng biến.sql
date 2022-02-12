USE HowKteam
GO

-- tìm ra mã giáo viên có lương thấp nhất
SELECT MAGV FROM dbo.GIAOVIEN 
WHERE LUONG = 
(
	SELECT MIN(LUONG) FROM dbo.GIAOVIEN
)

-- lấy ra tuổi của giáo viên với mã GV 001
SELECT YEAR(GETDATE()) - YEAR(NGSINH) AS [Tuổi của giáo viên] FROM dbo.GIAOVIEN
WHERE MAGV = 001

--------------------------------------------------------------------

-- tạo ra 1 biến kiểu char lưu mã giáo viên lương thấp nhất
DECLARE @minSalaryMAGV CHAR(10) -- 1
-- SET @minSalaryMAGV = '123';

-- cách dùng
-- bôi đen đồng thời dòng DECLARE để chạy (dòng 1 và 2)
SELECT @minSalaryMAGV = MAGV FROM dbo.GIAOVIEN WHERE LUONG = (SELECT MIN(LUONG) FROM dbo.GIAOVIEN); -- 2

-- tuổi của giáo viên có lương thấp nhất
-- bôi đen 1 2 3 đẻ chạy
SELECT YEAR(GETDATE()) - YEAR(NGSINH) AS [Tuổi của giáo viên] FROM dbo.GIAOVIEN -- 3
WHERE MAGV = @minSalaryMAGV;

----------------------------------------------------------
-- khởi tạo biến i
-- biến bắt đầu bằng kí hiệu @
DECLARE @i INT;

-- khởi tạo biến j có giá trị mặc định
DECLARE @j INT = 0;

-- set dữ liệu cho biến
SET @i = @i + 1;
SET @i += 1;

-- set thông qua câu select
DECLARE @maxLUONG INT;
SELECT @maxLUONG = MAX(LUONG) FROM dbo.GIAOVIEN;

--------------------------------------------------------------
-- 1. xuất ra người thân của giáo viên 001
-- lưu mã giáo viên 001
-- tìm ra người thân tương ứng

DECLARE @magv VARCHAR(10) = '001'

SELECT * FROM dbo.NGUOITHAN
WHERE MAGV = @magv

-- 2. Xuất ra tên của giáo viên có lương thấp nhất
DECLARE @MinLuong INT;
DECLARE @TenGV NVARCHAR(100);

SELECT @MinLuong = MIN(LUONG) FROM dbo.GIAOVIEN;
SELECT @TenGV = HOTEN FROM dbo.GIAOVIEN WHERE LUONG = @MinLuong;

-- xuất giá trị ra màn hình
PRINT @TenGV;
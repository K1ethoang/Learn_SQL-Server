USE HowKteam
GO

-- xuất ra danh sách tên bộ môn và số lượng giáo viên của bộ môn đó
SELECT BM.TENBM, BM.MAKHOA,COUNT(*) N'Số lượng giáo viên' FROM dbo.BOMON BM, dbo.GIAOVIEN GV
WHERE BM.MABM = gv.MABM
GROUP BY BM.TENBM, BM.MAKHOA
ORDER BY COUNT(*) DESC
-- cột hiển thị phải là thuộc tính nằm trong khối GROUP BY hoặc là Aggregate Function

-- Lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
-- truy vấn lồng
SELECT * FROM dbo.GIAOVIEN GV
WHERE GV.LUONG >
(
SELECT AVG(GV.LUONG) FROM dbo.GIAOVIEN GV
)


-- xuất ra tên giáo viên và số lượng đề tài giáo viên đó đã làm
SELECT GV.MAGV,GV.HOTEN,COUNT(*) N'Số lượng đề tài' FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV
GROUP BY GV.HOTEN, GV.MAGV

/* 
Aggregate Function

AVG() Returns the average function
COUNT() Returns the number of rows
FIRST() Returns the first value
LAST() Returns the last value
MAX() Returns the largest value
MIN() Returns the smallest value
ROUND() Rounds a numeric field to the number of decimals specified
SUM() Return the sum
*/


/*
String Function
 
CHARINDEX() Searches an expression in a string expression and returns its starting position if found
CONCAT()
LEFT()
LEN() / LENGTH() Returns the length of the value in text field
LTRIM() 
LOWER() / LCASE() Converts character data to lower case (viết thường)
SUBSTRING() / MID() Extract characters from a text field (lấy chuỗi con)
PATINDEX()
REPLACE()
RIGHT()
RTRIM()
UPPER() / UCASE() Converts character data to upper case (viết in hoa)
*/


--						Giải bài tập
-- 1. xuất ra tên giáo viên và số lượng người thân của giáo viên đó
SELECT GV.HOTEN,COUNT(*) AS N'Số lượng người thân' FROM dbo.GIAOVIEN AS GV,dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.HOTEN, GV.MAGV

-- 2. Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó đã tham gia
SELECT GV.HOTEN, COUNT(*) N'Số lượng đề tài đã hoàn thành' FROM dbo.GIAOVIEN GV, dbo.THAMGIADT TGDT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.KETQUA = N'Đạt'
GROUP BY GV.MAGV, GV.HOTEN

-- 3. xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
SELECT TOP (1) k.TENKHOA, SUM(gv.LUONG) AS N'Tổng lương' FROM dbo.KHOA k, dbo.BOMON bm, dbo.GIAOVIEN gv
	WHERE gv.MABM = bm.MABM AND bm.MAKHOA = k.MAKHOA
	GROUP BY k.TENKHOA, k.MAKHOA
	ORDER BY [Tổng lương] DESC

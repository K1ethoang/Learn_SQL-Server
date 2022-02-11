USE HowKteam
GO

-- kiểm tra xem giáo viên 001 có phải là giáo viên quản lí chuyên môn hay không
-- lấy ra danh sách các mã giáo viên QLCM
-- kiểm tra mã giáo viên tồn tại trong danh sách đó
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001' 
/* 001 tồn tại trong dach sách*/
AND  MAGV IN 
(SELECT GVQLCM FROM dbo.GIAOVIEN)

-- truy vấn lồng trong from
SELECT * FROM 
dbo.GIAOVIEN, (SELECT * FROM dbo.DETAI) AS DT

-- 1. Xuất ra danh sách giáo viên tham gia nhiều hơn 1 đề tài
-- lấy ra số lượng thông tin cúa giáo viên
SELECT * FROM dbo.GIAOVIEN GV
-- khi mà số lượng đề tài lớn hơn 1
WHERE 1 < 
(
	SELECT COUNT(*) FROM dbo.THAMGIADT TGDT
	WHERE TGDT.MAGV = GV.MAGV
)

-- 2. Xuất ra thông tin của Khoa mà có nhiều hơn 2 giáo viên
-- lấy được danh sách bộ môn nằm trong khoa hiện tại
SELECT * FROM dbo.KHOA K
WHERE 2 < 
(
SELECT COUNT(*) FROM dbo.BOMON BM, dbo.GIAOVIEN GV
WHERE BM.MAKHOA = K.MAKHOA AND GV.MABM = BM.MABM
)

-- sắp xếp giảm dần
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- sắp xếp tăng dần
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV ASC

-- lấy ra top 5 phần tử
SELECT TOP(5) * FROM dbo.GIAOVIEN

--								Giải bài tập
-- 1. Xuất ra thông tin giáo viên mà có hơn 1 người thân
SELECT GV.* FROM dbo.GIAOVIEN GV
WHERE 1 <
(
	SELECT COUNT(*) FROM dbo.NGUOITHAN NT
	WHERE GV.MAGV = NT.MAGV
)


-- 2. Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 giáo viên trong trường
/*- Gợi ý:
	- Lấy ra danh sách (MaGV, Tuoi) as GVT1
	- Sắp xếp tăng dần
	- Lấy ra danh sách GVT2 với số lượng phần tử = 5
	- Kiểm tra mã giáo viên tồn tại trong GVT2 là đúng
*/

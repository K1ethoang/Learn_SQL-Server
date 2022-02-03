USE HowKteam 
GO

-- lấy ra gv có lương > 2000
SELECT * FROM dbo.GIAOVIEN 
WHERE LUONG > 2000

-- lấy ra gv là nữ và lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE PHAI = N'Nữ' AND LUONG > 2000

-- lấy ra gv > 50 tuổi
-- YEAR -> lấy ra năm của ngày
-- GETDATE -> lấy ra ngày hiện tại
SELECT * FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 50

-- lấy ra họ tên gv, năm sinh và tuổi của giáo viên lớn < 50 tuổi
SELECT HOTEN, NGSINH, YEAR(GETDATE()) - YEAR(NGSINH) AS Tuổi  FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) < 50

-- lấy ra mã gv, tên gv và tên khoa của gv đó làm việc
SELECT GV.MAGV,GV.HOTEN,K.TENKHOA FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM, dbo.KHOA AS K -- 4
WHERE GV.MABM = BM.MABM AND	BM.MAKHOA = K.MAKHOA

-- lấy ra gv là trưởng bộ môn
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MAGV = bm.TRUONGBM

-- đếm số lượng giáo viên
-- COUNT(*) -> đếm số lượng của tất cả record
-- COUNT(tên trường nào đó) -> đếm số lượng của tên trường nào đó
SELECT COUNT(*) AS N'Số lượng giáo viên' FROM dbo.GIAOVIEN AS GV

-- đếm số lượng người thân của giáo viên có mã là 007
SELECT COUNT(*) AS N'Số lượng người thân' 
FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = '007' AND GV.MAGV = NT.MAGV

-- lấy ra tên gv là tên đề tài người đó tham gia
SELECT GV.HOTEN, DT.TENDT AS N'đề tài tham gia' 
FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.MADT = DT.MADT

-- lấy ra tên gv là tên đề tài người đó tham gia khi mà người đó tham gia nhiều hơn 1 lần
-- sẽ học trong bài truy vấn lồng


-- bài tập: 
-- 1. xuất ra thông tin gv và gv quản lí của người đó
-- 2. xuất ra số lượng gv của khoa CNTT
-- 3. xuất ra thông tin giáo viên và đề tài người đó tham gia khi đề tài là đạt

--					giải
 
SELECT GV1.*,GV2.HOTEN AS N'Giáo viên quản lí' FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV -- 1

SELECT COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE GV.MABM = BM.MABM AND	BM.MAKHOA = K.MAKHOA AND K.MAKHOA = 'CNTT' -- 2

SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.KETQUA = N'Đạt'

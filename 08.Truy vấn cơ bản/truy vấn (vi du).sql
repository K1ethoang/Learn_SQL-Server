-- lưu ý: chạy script query trước khi chạy thử script này
-- chạy file howkteam
USE HowKteam
GO

-- cấu trúc truy vấn
SELECT * FROM dbo.BOMON -- lấy hết các dữ liệu trong bảng bộ môn ra

-- lấy mã bộ môn + tên bộ môn trong bảng bộ môn
SELECT MABM, TENBM FROM dbo.BOMON

-- đổi tên cột hiển thị
SELECT MABM AS N'Viết tắt', TENBM AS N'Đầy đủ' FROM dbo.BOMON

-- xuất ra mã gv + tên + tên bộ môn giáo viên đó dạy
SELECT GV.MAGV,GV.HOTEN,BM.TENBM 
FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM

-- bài tập: 
-- 1. truy xuất thông tin của bảng Tham gia đề tài
-- 2. lấy ra mã khoa và tên khoa tương ứng (bảng Khoa)
-- 3. lấy ra họ mã gv, tên gv và họ tên người thân tương ứng
-- 4. lấy ra mã gv, tên gv và tên khoa của gv đó làm việc (nâng cao hơn với kiến thức của bài này). gợi ý: Bộ môn nằm trong khoa


--						lời giải

SELECT * FROM dbo.THAMGIADT -- 1

SELECT MAKHOA, TENKHOA FROM dbo.KHOA -- 2

SELECT GV.MAGV, GV.HOTEN, NT.TEN AS	N'Tên Người Thân'  FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS	NT -- 3
WHERE GV.MAGV = NT.MAGV

SELECT GV.MAGV,GV.HOTEN,K.TENKHOA FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM, dbo.KHOA AS K -- 4
WHERE GV.MABM = BM.MABM AND	BM.MAKHOA = K.MAKHOA

USE HowKteam
GO

-- Lấy hết dữ liệu của bảng giáo viên đưa vào bảng mới tên là tableA
-- Bảng này có các record tương ứng như bảng GV
SELECT * INTO tableA
FROM dbo.GIAOVIEN

-- Tạo ra 1 bảng tableB mới có 1 field là HoTen tương ứng như bảng GV
-- Dữ liệu của bảng tableB lấy từ GV ra
SELECT HOTEN INTO tableB
FROM dbo.GIAOVIEN

-- Tạo ra 1 bảng tableB mới có 1 field là HoTen tương ứng như bảng GV
-- Với điều kiện lương > 2000
-- Dữ liệu của bảng tableB lấy từ GV ra
SELECT HOTEN INTO tableC
FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Tạo 1 bảng từ nhiều bảng
 SELECT MAGV,HOTEN,TENBM INTO tableD
 FROM dbo.GIAOVIEN,dbo.BOMON
 WHERE BOMON.MABM = GIAOVIEN.MABM

 -- Tạo 1 bảng GVBK y chang không có dữ liệu
 SELECT * INTO GVBK
 FROM dbo.GIAOVIEN
 WHERE 6 > 9 -- điều kiện sai
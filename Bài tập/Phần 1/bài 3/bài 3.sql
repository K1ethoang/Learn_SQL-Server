CREATE DATABASE quan_ly_luong_nhan_vien
GO

USE quan_ly_luong_nhan_vien
go
--Sếp yêu cầu bạn thiết kế cơ sở dữ liệu quản lý lương nhân viên
--Với điều kiện:

--- mã nhân viên không được phép trùng
--- lương là số nguyên dương
--- tên không được phép ngắn hơn 2 ký tự
--- tuổi phải lớn hơn 18
--- giới tính mặc định là nữ
--- ngày vào làm mặc định là hôm nay
--- (*) nghề nghiệp phải nằm trong danh sách ('IT','kế toán','doanh nhân thành đạt')
--- tất cả các cột không được để trống

CREATE TABLE nhan_vien
(
	ma INT IDENTITY,
	luong INT NOT NULL,
	ho_ten NVARCHAR(100) NOT NULL,
	ngay_sinh DATE NOT NULL,
	gioi_tinh BIT DEFAULT 0 NOT NULL,
	ngay_vao_lam DATE DEFAULT GETDATE() NOT NULL,
	nghe_nghiep NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_ma PRIMARY KEY (ma),
	CONSTRAINT CK_luong_nguyen_duong CHECK (luong >= 0),
	CONSTRAINT CK_do_dai_ten CHECK (LEN(ho_ten) >= 2),
	CONSTRAINT CK_tuoi CHECK (YEAR(GETDATE()) - YEAR(ngay_sinh) > 18),
	CONSTRAINT CK_nghe_nghiep CHECK (nghe_nghiep IN (N'IT', N'kế toán', N'doanh nhân thành đạt'))
)

--1. Công ty có 5 nhân viên
INSERT INTO dbo.nhan_vien
(luong, ho_ten, ngay_sinh, gioi_tinh, ngay_vao_lam, nghe_nghiep)
VALUES
(58, N'Kiệt', '2001-02-09', 1, '2022-03-01', N'IT'),
(90, N'Như', '2003-09-23', 0, '2021-12-20', N'IT'),
(80, N'Hiếu','1999-11-22', 0, '2021-01-17', N'doanh nhân thành đạt'),
(67, N'Hoà', '1998-05-01', 1, '2017-05-31', N'kế toán'),
(67, N'Lân', '2000-02-14', 1, DEFAULT, N'kế toán')


--2. Tháng này sinh nhật sếp, sếp tăng lương cho nhân viên sinh tháng này thành 100. 
UPDATE dbo.nhan_vien SET luong = 100 WHERE MONTH(GETDATE()) = MONTH(ngay_sinh)
--2.1. (*: tăng lương cho mỗi bạn thêm 100)
UPDATE dbo.nhan_vien SET luong += 100


--3. Dịch dã khó khăn, cắt giảm nhân sự, cho nghỉ việc bạn nào lương dưới 50. 
DELETE FROM dbo.nhan_vien WHERE luong < 50
--3.1. (*: xoá cả bạn vừa thêm 100 (những bạn có tháng sinh trùng với sếp) nếu lương cũ dưới 50). 
DELETE FROM nhan_vien WHERE luong - 100 < 50 AND MONTH(GETDATE()) = MONTH(ngay_sinh)
--3.2. (**: đuổi cả nhân viên mới vào làm dưới 2 tháng)
DELETE FROM nhan_vien 
WHERE DATEDIFF(MONTH, ngay_vao_lam, GETDATE()) < 2 AND ngay_vao_lam < GETDATE()


--4. Lấy ra tổng tiền mỗi tháng sếp phải trả cho nhân viên. 
SELECT SUM(luong) AS 'tong_tien_phai_tra' FROM dbo.nhan_vien
--4.1. (*: theo từng nghề)
SELECT nghe_nghiep, SUM(luong) AS 'tong_tien_phai_tra' FROM dbo.nhan_vien
GROUP BY nghe_nghiep

--5. Lấy ra trung bình lương nhân viên.
SELECT AVG(luong) AS 'trung_binh_luong_nhan_vien' FROM dbo.nhan_vien
--5.1. (*: theo từng nghề)
SELECT nghe_nghiep, AVG(luong) AS 'trung_binh_luong_nhan_vien' FROM dbo.nhan_vien
GROUP BY nghe_nghiep


--6. (*) Lấy ra các bạn mới vào làm hôm nay
SELECT * FROM dbo.nhan_vien
WHERE DATEDIFF(DAY, ngay_vao_lam, GETDATE()) = 0

-- hoặc
SELECT * FROM dbo.nhan_vien
WHERE ngay_vao_lam = CAST(GETDATE() AS DATE)

--7. (*) Lấy ra 3 bạn nhân viên cũ nhất
SELECT TOP(3) * FROM dbo.nhan_vien
ORDER BY ngay_vao_lam ASC

--8. (**) Tách những thông tin trên thành nhiều bảng cho dễ quản lý, lương 1 nhân viên có thể nhập nhiều lần




----------------------------------------------------------------------------------------
-- bonus kiến thức
-- DATEDIFF()
-- CAST(GETDATE() AS DATE)
-- OFFSET

-- đừng chú ý
TRUNCATE TABLE dbo.nhan_vien
DROP TABLE dbo.nhan_vien
SELECT * FROM nhan_vien
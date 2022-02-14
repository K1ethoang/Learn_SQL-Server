CREATE DATABASE buoi3
GO

USE buoi3
GO

--- Tạo bảng lưu thông tin điểm của sinh viên (mã, họ tên, điểm lần 1, điểm lần 2)
--- Với điều kiện:
--	- điểm không được phép nhỏ hơn 0 và lớn hơn 10
--	- điểm lần 1 nếu không nhập mặc định sẽ là 5
CREATE TABLE sinhVien
(
	ma INT IDENTITY,
	ho_ten NVARCHAR(100),
	diem_lan_1 FLOAT DEFAULT 5,
	diem_lan_2 FLOAT,
	CONSTRAINT PK_ma PRIMARY KEY(ma),
	CONSTRAINT CK_gioi_han_diem CHECK(diem_lan_1 >= 0 AND diem_lan_1 <= 10 AND diem_lan_2 >= 0 AND diem_lan_2 <= 10),
	-- để lại 2 câu * để làm với alter
)

--	- (*) điểm lần 2 không được nhập khi mà điểm lần 1 lớn hơn hoặc bằng 5
ALTER TABLE dbo.sinhVien
ADD CONSTRAINT CK_nhap_diem_lan_2 CHECK ((diem_lan_1 >= 5 AND diem_lan_2 IS NULL) OR diem_lan_1 < 5);

--	- (**) tên không được phép ngắn hơn 2 ký tự
ALTER TABLE dbo.sinhVien
ADD CONSTRAINT CK_do_dai_ten CHECK (LEN(ho_ten) >= 2)


--1. Điền 5 sinh viên kèm điểm
INSERT INTO dbo.sinhVien
(ho_ten, diem_lan_1, diem_lan_2)
VALUES
(   N'Kiệt', 4, 1.6), (N'Như', 8, NULL), (N'Phát', 10, NULL), (N'Thiện', 2, 1), (N'Tuấn', 4, NULL);

--2. Lấy ra các bạn điểm lần 1 hoặc lần 2 lớn hơn 5
SELECT * FROM dbo.sinhVien
WHERE diem_lan_1 > 5 OR diem_lan_2 > 5

--3. Lấy ra các bạn qua môn ngay từ lần 1
SELECT * FROM dbo.sinhVien
WHERE diem_lan_1 >= 5

--4. Lấy ra các bạn trượt môn (lần 1 và 2 đều dưới 5)
SELECT * FROM dbo.sinhVien
WHERE diem_lan_1 < 5 AND diem_lan_2 < 5

--5. (*) Đếm số bạn qua môn sau khi thi lần 2
SELECT COUNT(*) AS so_ban_qua_mon_sau_khi_thi_lan_2 FROM dbo.sinhVien
WHERE diem_lan_2 >= 5

--6. (**) Đếm số bạn cần phải thi lần 2 (tức là thi lần 1 chưa qua nhưng chưa nhập điểm lần 2)
SELECT COUNT(*) as so_ban_can_phai_thi_lan_2 FROM dbo.sinhVien
WHERE diem_lan_1 < 5 AND diem_lan_2 IS NULL
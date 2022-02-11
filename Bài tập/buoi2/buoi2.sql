CREATE DATABASE buoi2
GO

USE	buoi2
GO

DROP TABLE dbo.KhachHang
-- Tạo bảng lưu thông tin khách hàng (mã, họ tên, số điện thoại, địa chỉ, giới tính, ngày sinh)
CREATE TABLE KhachHang
(
	ma VARCHAR(10),
	hoTen NVARCHAR(50),
	sdt VARCHAR(15),
	diaChi NVARCHAR(100),
	gioiTinh BIT,
	ngaySinh DATE

	CONSTRAINT PM
	PRIMARY KEY(ma,sdt)
)

-- 1. Thêm 5 khách hàng
INSERT INTO dbo.KhachHang -- 1
VALUES
(   123,       -- ma - char(10)
    N'Anh Kiệt',       -- hoTen - char(50)
    '123',       -- sdt - char(15)
    '123',       -- diaChi - char(100)
    1,     -- gioiTinh - bit
    '20030923' -- ngaySinh - date
),
(   234,       -- ma - char(10)
    N'Anh Thi',       -- hoTen - char(50)
    '234',       -- sdt - char(15)
    '234',       -- diaChi - char(100)
    0,     -- gioiTinh - bit
    '20010117' -- ngaySinh - date
),
(   343,       -- ma - char(10)
    N'Nam',       -- hoTen - char(50)
    '343',       -- sdt - char(15)
    '343',       -- diaChi - char(100)
    1,     -- gioiTinh - bit
    '19980117' -- ngaySinh - date
),
(   555,       -- ma - char(10)
    N'Nguyễn Anh Long',       -- hoTen - char(50)
    '555',       -- sdt - char(15)
    '555',       -- diaChi - char(100)
    1,     -- gioiTinh - bit
    '19851123' -- ngaySinh - date
),
(   111,       -- ma - char(10)
    N'Như',       -- hoTen - char(50)
    '111',       -- sdt - char(15)
    '111',       -- diaChi - char(100)
    0,     -- gioiTinh - bit
    '20030209' -- ngaySinh - date
)

-- 2. Hiển thị chỉ họ tên và số điện thoại của tất cả khách hàng 
SELECT hoTen,sdt FROM  dbo.KhachHang
GO

-- 3. Cập nhật khách có mã là 2 sang tên Tuấn
UPDATE dbo.KhachHang SET hoTen = N'Tuấn' WHERE ma = '343'

-- 4. Xoá khách hàng có mã lớn hơn 3 và giới tính là Nam
DELETE dbo.KhachHang WHERE ma > 444 AND gioiTinh = 1

-- 5. (*) Lấy ra khách hàng sinh tháng 1
SELECT * FROM dbo.KhachHang
WHERE MONTH(ngaySinh) = 01

-- 6. (*) Lấy ra khách hàng có họ tên trong danh sách (Anh,Minh,Đức) và giới tính Nam hoặc chỉ cần năm sinh trước 2000
SELECT * FROM dbo.KhachHang
WHERE hoTen LIKE N'%Anh%' AND gioiTinh = 1 OR YEAR(ngaySinh) < 2000

-- 7. (**) Lấy ra khách hàng có tuổi lớn hơn 18
SELECT * FROM dbo.KhachHang
WHERE YEAR(GETDATE()) - YEAR(ngaySinh) > 18

-- 8. (**) Lấy ra 3 khách hàng mới nhất
SELECT TOP 3 * FROM KhachHang
ORDER BY ma DESC

-- 9. (**) Lấy ra khách hàng có tên chứa chữ T
SELECT * FROM dbo.KhachHang
WHERE hoTen LIKE N'%T%'

-- 10. (***) Thay đổi bảng sao cho chỉ nhập được ngày sinh bé hơn ngày hiện tại
ALTER TABLE KhachHang
ADD CHECK(ngaySinh < GETDATE()) -- check() -> độc lập với cột

-- (***) Thay đổi bảng sao cho chỉ nhập được giới tính nam với bạn tên Kiệt hoặc khác tên Kiệt
ALTER TABLE KhachHang
ADD CONSTRAINT CK_gioi_tinh_kem_ten_kiet CHECK((gioiTinh = 1 AND hoTen = N'Kiệt') OR hoTen != N'Kiệt')
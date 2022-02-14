CREATE DATABASE Foreign_Key
go

USE Foreign_Key
go

CREATE TABLE BoMon
(
	MaBM VARCHAR(10) NOT NULL,
	TenBM NVARCHAR(100) DEFAULT N'Tên bộ môn'

	PRIMARY KEY(MaBM)
);

CREATE TABLE Lop
(
	MaLop VARCHAR(10) PRIMARY KEY,
	TenLop NVARCHAR(100) DEFAULT N'Tên lớp' 
);	

-- Điều kiện cần để tạo foreign key:
-- Tham chiếu tới khoá chính
-- Unique, NOT NULL
-- Cùng kiểu dữ liệu
-- Cùng số lượng trường có sắp xếp

-- Lợi ích: đảm bảo toàn vẹn dữ liệu, không có TH tham chiếu tới dữ liệu không tồn tại

CREATE TABLE GiaoVien
(
	MaGV VARCHAR(10) NOT NULL,
	TenGV NVARCHAR(50) DEFAULT N'Tên giáo viên',
	NgaySinh DATE,
	DiaChi NVARCHAR(100) DEFAULT N'Địa chỉ giáo viên',
	GioiTinh BIT,
	MaBM VARCHAR(10) -- foreign key

	-- tạo foreign key ngay khi tạo bảng
    FOREIGN KEY(MaBM) REFERENCES dbo.BoMon(MaBM)
);	

ALTER TABLE dbo.GiaoVien ADD PRIMARY KEY(MaGV)

CREATE TABLE SinhVien
(
	MaSV VARCHAR(10) PRIMARY KEY,
	TenSV NVARCHAR(50) DEFAULT N'Tên sinh viên',
	MaLop VARCHAR(10),
);
-- tạo khoá ngoại sau khi tạo bảng
ALTER TABLE dbo.SinhVien ADD CONSTRAINT FK_HS FOREIGN KEY(MaLop) REFERENCES dbo.Lop(MaLop)

-- huỷ khoá
-- ALTER TABLE dbo.SinhVien DROP CONSTRAINT FK_HS

INSERT INTO dbo.Lop
(
    MaLop,
    TenLop
)
VALUES
(   'L01', -- MaLop - varchar(10)
    N'Lop1' -- TenLop - nvarchar(100)
    ),
(   'L02', -- MaLop - varchar(10)
    N'Lop2' -- TenLop - nvarchar(100)
    ),
(   'L03', -- MaLop - varchar(10)
    N'Lop3' -- TenLop - nvarchar(100)
    );

INSERT INTO dbo.SinhVien
(
    MaSV,
    TenSV,
    MaLop
)
VALUES
(   '001',  -- MaSV - varchar(10)
    N'Kiet1', -- TenSV - nvarchar(50)
    'L01'   -- MaLop - varchar(10)
    ),
(   '002',  -- MaSV - varchar(10)
    N'Kiet2', -- TenSV - nvarchar(50)
    'L01'   -- MaLop - varchar(10)
    )
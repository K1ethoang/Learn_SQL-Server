CREATE DATABASE bai3
GO

USE bai3
GO

--Ban lãnh đạo thành phố yêu cầu bạn tạo bảng lưu các con vật trong sở thú

--Với điều kiện tự bạn quy ước (hãy áp dụng check và default)
CREATE TABLE dong_vat
(
	ma INT IDENTITY,
	ten NVARCHAR(100) NOT NULL,
	so_chan INT DEFAULT 0 NOT NULL,
	tuoi_tho INT NOT NULL,
	moi_truong_song NVARCHAR(50) NOT NULL,

	CONSTRAINT PM_ma PRIMARY KEY (ma),
	CONSTRAINT CK_ten CHECK (LEN(ten) > 1),
	CONSTRAINT CK_so_chan CHECK (so_chan >= 0 AND so_chan < 100 AND so_chan % 2 = 0),
	CONSTRAINT CK_tuoi_tho CHECK (tuoi_tho > 0)
)


--1. Sở thú hiện có 7 con
INSERT INTO dong_vat
(ten, so_chan, tuoi_tho, moi_truong_song)
VALUES
(N'Khỉ', 4, 15, N'trên cạn'),
(N'Hổ', 4, 25, N'trên cạn'),
(N'Cánh cụt', 2, 20, N'trên cạn'),
(N'Cá sấu', 4, 55, N'lưỡng cư'),
(N'Hồng hạc', 2, 10, N'trên cạn'),
(N'Cá heo', DEFAULT, 40, N'dưới nước'),
(N'Rùa', 4, 200, N'dưới nước')


--2. Thống kê có bao nhiêu con 4 chân
SELECT COUNT(*) AS 'so_con_vat_co_4_chan' FROM dong_vat
WHERE so_chan = 4


--3. Thống kê số con tương ứng với số chân
SELECT so_chan, COUNT(*) AS 'so_luong_con_vat' FROM dong_vat
GROUP BY so_chan


--4. Thống kê số con theo môi trường sống
SELECT moi_truong_song, COUNT(*) [so_luong_con_vat] FROM dong_vat
GROUP BY moi_truong_song


--5. Thống kê tuổi thọ trung bình theo môi trường sống
SELECT moi_truong_song, AVG(tuoi_tho) AS 'tuoi_tho_trung_binh' FROM dong_vat
GROUP BY moi_truong_song


--6. Lấy ra 3 con có tuổi thọ cao nhất
SELECT TOP 3 * FROM dong_vat
ORDER BY tuoi_tho DESC


--7. (*) Tách những thông tin trên thành 2 bảng cho dễ quản lý (1 môi trường sống gồm nhiều con)
--1 môi trường - n động vật (1-n)
CREATE TABLE moi_truong_song
(
	ma INT IDENTITY NOT NULL,
	ten NVARCHAR(50) NOT NULL UNIQUE,

	CONSTRAINT PK_ma PRIMARY KEY(ma)
)

-- tại vì là thằng cha nên nó phải có trước
INSERT INTO moi_truong_song (ten)
VALUES 
(N'Trên cạn'),
(N'Lưỡng cư'),
(N'Dưới nước')

SELECT * FROM dbo.moi_truong_song

DROP TABLE dbo.dong_vat

CREATE TABLE dong_vat
(
	ma INT IDENTITY,
	ten NVARCHAR(100) NOT NULL,
	so_chan INT DEFAULT 0 NOT NULL,
	tuoi_tho INT NOT NULL,
	ma_moi_truong_song INT NOT NULL,

	CONSTRAINT PM_ma PRIMARY KEY (ma),
	CONSTRAINT CK_ten CHECK (LEN(ten) > 1),
	CONSTRAINT CK_so_chan CHECK (so_chan >= 0 AND so_chan < 100 AND so_chan % 2 = 0),
	CONSTRAINT CK_tuoi_tho CHECK (tuoi_tho > 0),
	FOREIGN KEY (ma_moi_truong_song) REFERENCES dbo.moi_truong_song,
)

INSERT INTO dbo.dong_vat
(ten, so_chan, tuoi_tho, ma_moi_truong_song)
VALUES
(N'Khỉ', 4, 15, 1),
(N'Cá heo', DEFAULT, 40, 3)


SELECT * FROM dbo.dong_vat

-----------------------------------------------------------------------------
-- bonus kiến thức
-- MQH
	-- 1 - 1
	-- 1 - n
	-- n - n
USE HowKteam
GO

CREATE TABLE TestAutoIncreament
(
	id INT PRIMARY KEY IDENTITY, 
	-- tự tăng trường này, phải là số
	-- Mặc định từ 1 và tăng 1 đơn vị
	name NVARCHAR(100)
)

-- khi insert không cần trường id
INSERT INTO dbo.TestAutoIncreament
(name) VALUES
(N'Kiệt'),(N'Như'),(N'Nam'),(N'Tuấn')

SELECT * FROM dbo.TestAutoIncreament

-- TRUNCATE TABLE dbo.TestAutoIncreament -- xoá dữ liệu trong bảng (không xoá bảng)

CREATE TABLE TestAutoIncreament2
(
	id INT PRIMARY KEY IDENTITY(5,10),
	-- tự tăng bắt đầu từ 5. mỗi lần tăng 10 đơn vị
	name NVARCHAR(100)
)

INSERT INTO dbo.TestAutoIncreament2
(name) VALUES
(N'Kiệt'),(N'Như'),(N'Nam'),(N'Tuấn')
SELECT * FROM dbo.TestAutoIncreament2
USE HowKteam
GO

-- cách 1
CREATE TABLE testCheck
(
	id INT CONSTRAINT CK_id PRIMARY KEY IDENTITY CHECK(id <= 10),
	luong INT CONSTRAINT CK_luong	CHECK (luong > 3000 AND luong < 9000)
)
GO 

INSERT dbo.testCheck
(luong) VALUES
(3001),(4000),(8999)
GO

SELECT * FROM dbo.testCheck

/*
-- cách 2
CREATE TABLE testCheck2
(
	id INT CONSTRAINT CK_id2 PRIMARY KEY IDENTITY CHECK(id <= 10),
	luong INT,
	CONSTRAINT CK_luong	CHECK2 (luong > 3000 AND luong < 9000)
)
GO

-- cách 3
CREATE TABLE testCheck3
(
	id INT CONSTRAINT CK_id3 PRIMARY KEY IDENTITY CHECK(id <= 10),
	luong INT
)

ALTER TABLE dbo.testCheck3
ADD CONSTRAINT CK_luong3	CHECK (luong > 3000 AND luong < 9000)
*/

-- xoá bảng
DROP TABLE dbo.testCheck
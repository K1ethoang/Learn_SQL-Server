USE HowKteam
GO

CREATE TABLE testIndex
(
	ma INT,
	ho VARCHAR(50),
	ten VARCHAR(50),
	CONSTRAINT PL_ma PRIMARY KEY(ma)
)

-- tạo index trên bảng testIndex
-- tăng tốc độ tìm kiếm nhưng sẽ chậm tốc độ thêm, xoá, sửa
CREATE NONCLUSTERED INDEX idx_ten
ON dbo.testIndex(ten)

-- xoá index và bảng
DROP INDEX dbo.testIndex.idx_ten;
DROP TABLE dbo.testIndex

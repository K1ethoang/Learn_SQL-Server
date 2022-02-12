USE HowKteam
GO

-- insert 10000 record vào bảng cloneBM 
-- mà không trùng ID 
-- tên bộ môn tăng dần

-- clonde bảng Bộ môn trước
SELECT * INTO CloneBM
FROM dbo.BOMON
GO	


-- code
DECLARE @i INT = 0;
DECLARE @n INT = 10000;

WHILE (@i < @n)
	BEGIN
	    INSERT INTO dbo.CloneBM
	    (
	        MABM,
	        TENBM,
	        PHONG,
	        DIENTHOAI,
	        TRUONGBM,
	        MAKHOA,
	        NGAYNHANCHUC
	    )
	    VALUES
	    (   @i,      -- MABM - nchar(4)
	        @i,      -- TENBM - nchar(50)
	        'B15',       -- PHONG - char(3)
	        '0123456162',       -- DIENTHOAI - char(11)
	        NULL,      -- TRUONGBM - nchar(3)
	        N'CNTT',      -- MAKHOA - nchar(4)
	        GETDATE() -- NGAYNHANCHUC - date
	    )
		SET @i+=1;
	END

-- xem bảng CloneBM
SELECT * FROM dbo.CloneBM

-- xoá bảng ClondeBM
DROP TABLE dbo.CloneBM
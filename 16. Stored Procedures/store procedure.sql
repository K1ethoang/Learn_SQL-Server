USE HowKteam
GO

/*
CREATE PROCEDURE <tên store>
[Parameter nếu có]
as
BEGIN
	<Code xử lý>
END

Nếu chỉ là câu truy vấn thì	có thể không cần Begin và End
*/

-- tạo bình thường không có parameter
CREATE PROCEDURE USP_select_all_GV
AS
SELECT * FROM dbo.GIAOVIEN

EXEC dbo.USP_select_all_GV
go

-- tạo nhưng có parameter
CREATE PROCEDURE USP_test
@MaGv VARCHAR(10), @Luong INT
AS
SELECT * FROM dbo.GIAOVIEN WHERE MAGV = @MaGv AND LUONG = @Luong
GO

EXEC dbo.USP_test @MaGv = '008', @Luong = 1800
go


-- Đừng chú ý he
DROP PROCEDURE dbo.USP_test
DROP PROCEDURE dbo.USP_select_all_GV
USE HowKteam
GO

-- VD1: kiểm tra xem lương của	giáo viên có lớn hơn lương trung bình
DECLARE @luongTrungBinh INT

SELECT @luongTrungBinh = AVG(LUONG) FROM dbo.GIAOVIEN

DECLARE @maGV VARCHAR(10) = '001'	
DECLARE @LuongMaGV INT = 0

SELECT @LuongMaGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @maGV

-- nếu lương của @maGV > @luongTrungBinh
-- xuất ra 'lớn hơn'
-- ngược lại xuất 'nhỏ hơn'

-- thêm begin - end để các bạn tổng quát hơn 
IF @luongTrungBinh >  @LuongMaGV
	BEGIN
		PRINT N'Lương mã giáo viên: '
		PRINT @LuongMaGV
		PRINT N'Lương trung bình: '
		PRINT @luongTrungBinh
		PRINT N'Nhỏ hơn'
	END
ELSE
	BEGIN
		PRINT N'Lương mã giáo viên: '
		PRINT @LuongMaGV
		PRINT N'Lương trung bình: '
		PRINT @luongTrungBinh
		PRINT N'Lớn hơn'
	END


-- VD2: Update lương của toàn bộ giáo viên nếu lương nhập vào cao hơn lương trung bình
-- Ngược lại chỉ update lương giáo viên nam

-- clone bảng giáo viên
SELECT * INTO cloneGV
FROM dbo.GIAOVIEN
-- insert dữ liệu vào cloneGV
INSERT INTO cloneGV
SELECT * FROM dbo.GIAOVIEN

-- code
DECLARE @luongTrungBinh2 INT

SELECT @luongTrungBinh2 = AVG(LUONG) FROM dbo.cloneGV

DECLARE @luong INT = 2000

IF(@luong > @luongTrungBinh2)
	BEGIN
	    UPDATE dbo.cloneGV SET LUONG = @luong
		PRINT N'Đã cập nhật lại lương tất cả giáo viên'
	END
ELSE
	BEGIN
		UPDATE dbo.cloneGV SET LUONG = @luong WHERE PHAI = N'Nam'
		PRINT N'Đã cập nhật lương cho giáo viên nam'	    
	END

-- xem bảng cloneGV
SELECT * FROM dbo.cloneGV

-- xoá bảng cloneGV
DROP TABLE dbo.cloneGV
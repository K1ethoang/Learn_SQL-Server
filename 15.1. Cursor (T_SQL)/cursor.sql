USE HowKteam
GO

-- từ tuổi của giáo viên
-- nếu lớn hơn 60 thì cho lương cộng thêm 3000
-- Nếu nhỏ hơn 50 và lớn hơn 60 thì cộng thêm 1500
-- Ngược lại thì lương 500

-- trước tiên cần clone bảng GiaoVien
SELECT * INTO CloneGV
FROM dbo.GIAOVIEN

-- code
---------------------------

-- lấy ra danh sách MaGV và Tuổi đưa vào con trỏ có tên là GiaoVienCursor 
DECLARE GiaoVienCursor CURSOR
FOR SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH) AS [Tuổi Giáo Viên] FROM dbo.cloneGV

OPEN GiaoVienCursor;

DECLARE @MaGV VARCHAR(10), 
		@Tuoi INT;

FETCH NEXT FROM GiaoVienCursor INTO	@MaGV,@Tuoi;

WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Tuoi > 60
			BEGIN
			    UPDATE dbo.cloneGV SET LUONG = 3000 WHERE MAGV = @MaGV;
			END
		ELSE
			BEGIN
				IF @Tuoi > 50 AND @Tuoi < 60
					BEGIN
						UPDATE dbo.cloneGV SET LUONG = 1500 WHERE MAGV = @MaGV;
					END
				ELSE
					BEGIN
						UPDATE dbo.cloneGV SET LUONG = 500 WHERE MAGV = @MaGV;		    
					END
			END
		FETCH NEXT FROM GiaoVienCursor INTO @MaGV, @Tuoi;
	END 

CLOSE GiaoVienCursor;
DEALLOCATE GiaoVienCursor;

------------------------------

-- xem CloneGV
SELECT * FROM dbo.cloneGV

-- xoá clone GV
DROP TABLE dbo.cloneGV
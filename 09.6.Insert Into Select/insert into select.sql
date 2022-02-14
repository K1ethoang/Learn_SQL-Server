USE HowKteam
GO

-- insert into select -> copy dữ liệu vào bảng đã tồn tại

SELECT * INTO cloneGV
FROM dbo.GIAOVIEN
WHERE 1 = 0 -- clone bảng GV mà không lấy thông tin, chỉ lấy các trường

INSERT INTO cloneGV
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM dbo.cloneGV
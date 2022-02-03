USE HowKteam
GO	

-- inner join -> kiểu cũ
-- mọi join đều đi kèm điều kiện
SELECT * FROM 
dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.GIAOVIEN.MABM = dbo.BOMON.MABM

-- inner join -> kiểu mới -> đúng chuẩn
-- nên sử dụng theo cách này
SELECT * FROM
dbo.GIAOVIEN GV INNER JOIN dbo.BOMON BM
ON BM.MABM = GV.MABM

-- có thể viết tắt
SELECT * 
FROM dbo.KHOA K JOIN dbo.BOMON BM
ON BM.MAKHOA = K.MAKHOA
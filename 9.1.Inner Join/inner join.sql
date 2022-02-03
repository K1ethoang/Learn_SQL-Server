USE HowKteam
GO	

-- inner join -> kiểu cũ
-- mọi join đều đi kèm điều kiện
SELECT * FROM 
dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.GIAOVIEN.MABM = dbo.BOMON.MABM

-- chuẩn
SELECT * FROM
dbo.GIAOVIEN INNER JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM
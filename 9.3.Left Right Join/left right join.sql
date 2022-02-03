USE HowKteam
GO

-- left join
-- bảng bên phải nhập vào bảng bên trái
-- record nào bảng bên phải không có thì để NULL
-- record nào bảng trái không có thì không điền vào
-- không có sự đối xứng như inner và outer
SELECT * 
FROM dbo.GIAOVIEN LEFT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

-- right join
SELECT * 
FROM dbo.GIAOVIEN RIGHT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM
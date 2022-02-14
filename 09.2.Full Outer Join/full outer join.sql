USE HowKteam
GO

-- gom 2 bảng lại theo điều kiện. Bên nào không có dữ liệu thì để NULL
SELECT *
FROM dbo.GIAOVIEN FULL OUTER JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

-- cross join là tổ hợp mỗi record của bảng A với all record của bảng B
-- giống inner join cũ
SELECT *
FROM dbo.GIAOVIEN CROSS JOIN dbo.BOMON

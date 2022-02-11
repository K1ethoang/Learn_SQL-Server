USE HowKteam
GO

-- xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 1
-- having -> như where của select nhưng giành cho group by
-- having là where của group by
SELECT bm.MABM, COUNT(*) FROM dbo.GIAOVIEN gv, dbo.BOMON bm
WHERE gv.MABM = bm.MABM 
GROUP BY bm.MABM HAVING COUNT(*) > 1

-- xuất ra mức lương và tổng số tuổi của các giáo viên nhận mức lương đó
-- và có người thân
-- và có lương > 2000
SELECT LUONG, SUM(YEAR(GETDATE()) - YEAR(gv.NGSINH)) FROM dbo.GIAOVIEN gv,dbo.NGUOITHAN nt
WHERE gv.MAGV = nt.MAGV 
AND	gv.MAGV IN (SELECT gv.MAGV FROM	dbo.NGUOITHAN)
GROUP BY LUONG,gv.NGSINH
HAVING gv.LUONG > 2000

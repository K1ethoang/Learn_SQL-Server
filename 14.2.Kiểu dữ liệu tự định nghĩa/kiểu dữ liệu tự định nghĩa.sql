USE HowKteam
GO

-- kiểu dữ liệu tự định nghĩa
-- 2 câu dưới có ý nghĩa như nhau
EXEC sys.sp_addtype 'NName', 'nvarchar(100)','not null'   
EXEC sp_addtype 'NName2', 'nvarchar(100)', 'Not null'

CREATE TABLE testType
(
	name NName,
	address NVARCHAR(100)
)
GO


--xoá bảng
DROP TABLE dbo.testType

-- xoá type vừa định nghĩa
-- nếu có bảng sử dụng kiểu dữ liệu trên thì phải xoá bảng trước

-- cách 1
DROP TYPE NName
-- cách 2
EXEC sys.sp_droptype NName
EXEC sp_droptype NName2
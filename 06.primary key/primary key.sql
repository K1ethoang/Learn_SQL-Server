CREATE TABLE primarykeytest1
(
	id INT PRIMARY KEY,
	NAME NVARCHAR(50)
)
GO

CREATE TABLE primarykeytest2
(
	id INT NOT NULL,
	id2 INT NOT NULL,
	NAME NVARCHAR(50)

	PRIMARY KEY(id,id2)
)
GO

CREATE TABLE primarykeytest3
(
	id INT PRIMARY KEY,
	NAME NVARCHAR(50) DEFAULT 'unknown'
)
GO

INSERT INTO dbo.primarykeytest3
(
    id
)
VALUES
(   4  -- id - int
    ), 
(   5  -- id - int
    ), 
(   6  -- id - int
    )


CREATE TABLE primarykeytest4
(
	id INT,
	name NVARCHAR(60)

	PRIMARY KEY(id)
)
GO	

INSERT INTO dbo.primarykeytest4
(
    id,
    name
)
VALUES
(   1,  -- id - int
    N'null' -- name - nvarchar(60)
    )

DROP TABLE dbo.primarykeytest6

CREATE TABLE primarykeytest6
(
	id INT NOT NULL,
	name NVARCHAR(60)

)
GO 

ALTER TABLE dbo.primarykeytest6 ADD CONSTRAINT pk_test6	PRIMARY KEY(id)


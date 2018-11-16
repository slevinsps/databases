use example;
GO

DROP TABLE example.dbo.[���������]
GO

DROP TABLE example.dbo.[�����] 
GO

DROP TABLE example.dbo.[����������] 
GO

DROP TABLE example.dbo.[C��M��] 
GO

create table [���������]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[�����_ID] int,
	[���������] nvarchar(50)  NOT NULL,
	[���] nvarchar(100)  NOT NULL,
	[��������] money  NOT NULL
)
GO

create table [�����]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[�������� ������] nvarchar(50)  NOT NULL,
	[�������] nvarchar(30),
	[����������] int  NOT NULL
)
GO

create table [����������]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[��������] nvarchar(60)  NOT NULL,
	[����������] nvarchar(100),
	[���������] money  NOT NULL
)
GO

create table [C��M��]
(
	med_id int NOT NULL,
	sot_id int NOT NULL,
	PRIMARY KEY(med_id, sot_id),
	
	foreign key (med_id) references [����������],
	foreign key (sot_id) references [���������]
)
GO
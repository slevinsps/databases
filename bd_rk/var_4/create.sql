use example;
GO

DROP TABLE example.dbo.[Сотрудник]
GO

DROP TABLE example.dbo.[Отдел] 
GO

DROP TABLE example.dbo.[Медикамент] 
GO

DROP TABLE example.dbo.[CотMед] 
GO

create table [Сотрудник]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[Отдел_ID] int,
	[Должность] nvarchar(50)  NOT NULL,
	[ФИО] nvarchar(100)  NOT NULL,
	[Зарплата] money  NOT NULL
)
GO

create table [Отдел]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[Название отдела] nvarchar(50)  NOT NULL,
	[Телефон] nvarchar(30),
	[Заведующий] int  NOT NULL
)
GO

create table [Медикамент]
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	[Название] nvarchar(60)  NOT NULL,
	[Инструкция] nvarchar(100),
	[Стоимость] money  NOT NULL
)
GO

create table [CотMед]
(
	med_id int NOT NULL,
	sot_id int NOT NULL,
	PRIMARY KEY(med_id, sot_id),
	
	foreign key (med_id) references [Медикамент],
	foreign key (sot_id) references [Сотрудник]
)
GO
USE [var_4]
GO

DROP TABLE [var_4].dbo.Buyer_Florist
GO

DROP TABLE [var_4].dbo.Bouquet 
GO

DROP TABLE var_4.dbo.Florist 
GO

DROP TABLE [var_4].dbo.Buyer 
GO

CREATE TABLE Florist
(
	ID				INT				NOT NULL  IDENTITY(1, 1),
	first_name		NVARCHAR(50)		NOT NULL,
	surname			NVARCHAR(50),
	middle_name		NVARCHAR(50),
	passport_num		INT				NOT NULL,
	phone_num		NVARCHAR(20)		NOT NULL,

	CONSTRAINT PK_Florist PRIMARY KEY (ID),
	CONSTRAINT С_passport CHECK (passport_num BETWEEN 1000 AND 9999),
)
GO

CREATE TABLE Bouquet
(
	ID				INT				NOT NULL  IDENTITY(1, 1),
	author_ID		INT				NOT NULL,
	bouq_name		NVARCHAR(50)		NOT NULL,

	CONSTRAINT PK_Bouquet		PRIMARY KEY (ID),
	CONSTRAINT FK_author_ID		FOREIGN KEY (author_ID) REFERENCES Florist(ID),
)
GO

CREATE TABLE Buyer
(
	ID				INT				NOT NULL  IDENTITY(1, 1),
	first_name		NVARCHAR(50)		NOT NULL,
	surname			NVARCHAR(50),
	middle_name		NVARCHAR(50),
	born_date		DATE				NOT NULL, 
	city				NVARCHAR(50)		NOT NULL,
	phone_num		NVARCHAR(20)		NOT NULL,

	CONSTRAINT PK_Buyer PRIMARY KEY (ID),
	CONSTRAINT С_phone_num CHECK (phone_num LIKE '8%'),	--номер начинается с 8
)
GO

CREATE TABLE Buyer_Florist
(
	ID_buyer		INT		NOT NULL,
	ID_florist	INT		NOT NULL,

	CONSTRAINT PK_Buyer_Florist PRIMARY KEY (ID_buyer, ID_florist),
	CONSTRAINT FK_ID_buyer		FOREIGN KEY (ID_buyer)		REFERENCES Buyer(ID),
	CONSTRAINT FK_ID_florist		FOREIGN KEY (ID_florist)		REFERENCES Florist(ID),
)
GO
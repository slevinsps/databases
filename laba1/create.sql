USE master
GO

IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Film_contract'
) 

CREATE DATABASE Film_contract
GO

USE Film_contract
GO

IF OBJECT_ID('dbo.Contracts', 'U') IS NOT NULL
DROP TABLE dbo.Contracts
GO

-- Create a new table called 'T' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Films', 'U') IS NOT NULL
DROP TABLE dbo.Films
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Films
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(30) NOT NULL,
    Genre VARCHAR(30),
    Country VARCHAR(30), 
    Year int,
    Budget Money,
	Gross Money
);
GO


IF OBJECT_ID('dbo.Actors', 'U') IS NOT NULL
DROP TABLE dbo.Actors
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Actors
(
    ID int IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(30) NOT NULL,
    Birthdate datetime,
    Rating Int, 
    Åxperience int
);
GO

IF OBJECT_ID('dbo.Studios', 'U') IS NOT NULL
DROP TABLE dbo.Studios
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Studios
(
    ID int IDENTITY(1,1) PRIMARY KEY, 
    Name VARCHAR(30) NOT NULL,
	Country VARCHAR(30), 
	Owner VARCHAR(30), 
    Employees_number int,
	Parent_company INT  REFERENCES Studios (ID)
);
GO



-- Create the table in the specified schema
CREATE TABLE dbo.Contracts
(
    ID INT IDENTITY(1,1) PRIMARY KEY, 
    Actor INT NOT NULL REFERENCES Actors (ID),
	Film INT NOT NULL REFERENCES Films (ID),
	Fee Money,
	Work_days INT,
	Studio INT NOT NULL REFERENCES Studios (ID)
);
GO


ALTER TABLE dbo.Films ADD
CONSTRAINT Budget_chk CHECK (Budget > 0),
CONSTRAINT Gross_chk CHECK (Gross >= 0)
GO

ALTER TABLE dbo.Studios ADD
CONSTRAINT Empl_chk CHECK (Employees_number > 0)
GO

ALTER TABLE dbo.Contracts ADD
CONSTRAINT Fee_chk CHECK (Fee > 0),
CONSTRAINT Work_chk CHECK (Work_days > 0)
GO
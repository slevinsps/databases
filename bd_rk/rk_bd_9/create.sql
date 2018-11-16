use master
go
--drop database RK2
--go
create database RK2
go
use RK2
go

go
--DROP TABLE dbo.Avto
--go
create table dbo.Avto
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Brand VARCHAR(30),
	Model VARCHAR(20),
    Issue_date datetime,
    Reg_date datetime,
)

go

--DROP TABLE dbo.Driver
--go
create table dbo.Driver
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Number_license VARCHAR(30),
	phone VARCHAR(20),
    fio VARCHAR(30),
    Avto INT NOT NULL REFERENCES Avto(ID),
)

go

--DROP TABLE dbo.Fine
--go
create table dbo.Fine
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	type_violation VARCHAR(30),
	Fine_col Money,
	Warning VARCHAR(30),
)
go
--DROP TABLE dbo.FineDriver
--go
create table dbo.FineDriver
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Driver INT NOT NULL REFERENCES Driver(ID),
	Fine INT NOT NULL REFERENCES Fine(ID),
)

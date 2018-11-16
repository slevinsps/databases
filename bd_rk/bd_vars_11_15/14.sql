--Создать хранимую процедуру с выходным параметром, которая уничтожает 
--все представления в текущей базе данных, которые не были зашифрованы. 
--Выходной параметр возвращает количество уничтоженных представлений.
--Созданную хранимую процедуру протестировать.

drop view BMW
go
CREATE VIEW BMW 
	AS SELECT * 
	FROM dbo.Avto 
	WHERE brand = 'BMW'; 

go

drop view BMW2
go
CREATE VIEW BMW2
WITH ENCRYPTION  
	AS SELECT * 
	FROM dbo.Avto 
	WHERE brand = 'BMW'; 

go

/*
SELECT *
FROM sys.objects
WHERE type = 'V'*/

drop PROCEDURE dbo.Drop_view
go
CREATE PROCEDURE dbo.Drop_view
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX) = ''
	DECLARE @count_procs int

	SELECT @sql = @sql + 'DROP view ' + ob1.name + '; ' 
	FROM sys.objects as ob1 JOIN sys.sql_modules as par1 ON ob1.object_id = par1.object_id and LEN(par1.definition) > 0
	where type = 'V' 

	SELECT @count_procs = COUNT(*) 
	FROM sys.objects as ob1 JOIN sys.sql_modules as par1 ON ob1.object_id = par1.object_id and LEN(par1.definition) > 0
	where type = 'V' 
 
	EXEC (@sql)
	return @count_procs

END
GO

SELECT *
FROM sys.objects
WHERE type = 'V'
go
DECLARE @count int
EXEC @count = dbo.Drop_view 
SELECT @count as count
go
SELECT *
FROM sys.objects
WHERE type = 'V'
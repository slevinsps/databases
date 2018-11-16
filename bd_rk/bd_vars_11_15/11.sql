--В 11
--Создать хранимую процедуру с выходным параметром, которая уничтожает все SQL функции
--пользователя (функции типа 'FN', 'IF' и 'TF') в схеме 'dbo' в текущей базе данных. 
--Выходной параметр возвращает количество уничтоженных функций. 
--Созданную хранимую процедуру протестировать.

DROP PROCEDURE dbo.Drop_functions 
GO

CREATE PROCEDURE dbo.Drop_functions 
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX) = ''
	DECLARE @count_procs int

	SELECT @sql = @sql + 'DROP FUNCTION ' + name + '; ' 
	FROM sys.objects
	WHERE type = 'FN' or type = 'IF' or type = 'TF'
 
	SELECT @count_procs = COUNT(*) FROM sys.objects
	WHERE type = 'FN' or type = 'IF' or type = 'TF'
 
	EXEC (@sql)
	return @count_procs

END
GO


SELECT * FROM sys.objects
	WHERE type = 'FN' or type = 'IF' or type = 'TF'
/*
DECLARE @count int
EXEC @count = dbo.Drop_functions 
SELECT @count*/
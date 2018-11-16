USE [var_4]
GO

-- запрос без процедуры
SELECT name, definition
FROM var_4.SYS.check_constraints
WHERE CHARINDEX('LIKE', definition) <> 0
GO

DROP PROC print_constraint_names
GO

-- процедура не распознаёт одинарные кавычки, без них нельзя
CREATE PROC print_constraint_names 
@DATA_BASE NVARCHAR(30)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT name, definition FROM ' + @DATA_BASE + '.SYS.check_constraints' 
--				+ 'WHERE CHARINDEX(''LIKE'', definition) <> 0'
    EXEC(@SQL)
END

-- выполнить процедуру
DECLARE @base_name NVARCHAR(30) = 'var_4'
EXECUTE print_constraint_names @base_name
GO

SELECT '''dd'''
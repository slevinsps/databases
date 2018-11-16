use RK2
go
--drop TRIGGER fine_insert
go
CREATE TRIGGER fine_insert
ON Fine
INSTEAD OF insert
AS
DECLARE @money INT
SET @money = (select Fine_col from inserted)
if @money > 100
begin
INSERT INTO Fine(type_violation, Fine_col, Warning)
SELECT type_violation, Fine_col, Warning FROM inserted
end
else
begin 
print 'Its so few'
rollback
end
go 

DROP PROCEDURE drop_all_triggers 
go
CREATE PROCEDURE drop_all_triggers @count INT OUTPUT
AS
DECLARE @sql NVARCHAR(MAX) = ''
BEGIN 
	SELECT @sql = @sql + 'DROP TRIGGER ' + t.name + '; ' 
	FROM sys.triggers AS t 
	WHERE t.[type] = 'TR'
 
	SELECT @count = COUNT(*) FROM sys.triggers AS t
 
	EXEC (@sql)
END;
go

DECLARE @res INT;
EXEC drop_all_triggers @count=@res OUTPUT;
print @res




 

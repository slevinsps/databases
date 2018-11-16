--Создать хранимую процедуру с параметром, в которой для экземпляра SQL Server
--создаются резервные копии всех пользовательских баз данных, созданных или переименованных после даты, 
--указанной в параметре процедуры. Имя файла резервной копии должно состоять из 
--имени базы данных и даты создания резервной копии, разделенных символом нижнего подчеркивания
--Дата создания резервной копии должна быть представлена в формате YYYYDDMM. Созданную хранимую процедуру протестировать.

drop PROC dbo.BackUpd
go
CREATE PROC dbo.BackUpd
@DATE_BASE datetime
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX) = ''
	DECLARE @count_procs int

	SELECT @sql = @sql + 'BACKUP DATABASE ' + base.name + ' TO DISK = ''D:\MSBACKUP\' + base.name + convert(varchar, getdate(), 12) + '.BAK''; ' 
	FROM sys.databases as base 
	where base.create_date >=  @DATE_BASE

	

	SELECT @count_procs = COUNT(*) 
	FROM sys.databases as base 
	where base.create_date >=  @DATE_BASE
 
	EXEC (@sql)
	return @count_procs

END
GO
DECLARE @count int
DECLARE @base_date datetime = '20170327'
EXECUTE @count = dbo.BackUpd @base_date
SELECT @count as count
GO
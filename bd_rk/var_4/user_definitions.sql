USE example
GO

-- —оздать хранимую процедуру с двум€ входными параметрами Ц им€ базы
-- данных и им€ таблицы, котора€ выводит сведени€ об индексах указанной
-- таблицы в указанной базе данных. 
CREATE PROC get_index_info
@DATA_BASE NVARCHAR(30),
@TABLE NVARCHAR(30)
AS
BEGIN
	Declare @basedate_id int
	Declare @table_id int

	set @basedate_id = DB_ID(@DATA_BASE)
	set @table_id = OBJECT_ID(@TABLE)

	if (@basedate_id is not null and @table_id is not null)
		select index_depth, index_id, index_level,index_type_desc
		 from sys.dm_db_index_physical_stats( 
			@basedate_id,
			@table_id,
			NULL,
			NULL,
			NULL)
	if (@basedate_id is null)
		select 'basedate error'
	if (@table_id is null)
		select 'table error' 
END
Go

EXECUTE get_index_info 'example', '[—отрудник]'
GO

drop proc get_index_info
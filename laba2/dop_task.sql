USE dop
GO

IF OBJECT_ID('dbo.table1', 'U') IS NOT NULL
DROP TABLE dbo.table1
GO
CREATE TABLE dbo.table1
(
	Id INT, 
    Var1 VARCHAR(30),
    vfd date,
    vtd date,
);
GO

IF OBJECT_ID('dbo.table2', 'U') IS NOT NULL
DROP TABLE dbo.table2
GO

CREATE TABLE dbo.table2
(
	Id INT, 
    Var2 VARCHAR(30),
    vfd date,
    vtd date,
);
GO


insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (1, 'A', '20180901', '20180908')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (1, 'B', '20180909', '20180925')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (1, 'C', '20180926', '20180928')

insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'D', '20180901', '20180903')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'E', '20180904', '20180907')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'F', '20180908', '20180915')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'G', '20180916', '20180926')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'H', '20180927', '20180928')



/*
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (2, 'A', '20180901', '20180915')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (2, 'B', '20180916', '59991231')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (2, 'C', '20180901', '20180913')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (2, 'D', '20180914', '59991231')

insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (1, 'E', '20180901', '20180915')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (1, 'F', '20180916', '59991231')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'G', '20180901', '20180918')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (1, 'H', '20180919', '59991231')
*/

/*
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (2, 'A', '20180901', '20180902')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (2, 'A', '20180903', '20180904')
insert into dbo.table1(Id, Var1, vfd, vtd) VALUES (2, 'A', '20180905', '20180909')

insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (2, 'A', '20180901', '20180907')
insert into dbo.table2(Id, Var2, vfd, vtd) VALUES (2, 'A', '20180908', '20180909')
*/
IF OBJECT_ID('dbo.table3', 'U') IS NOT NULL
DROP TABLE dbo.table3
GO

CREATE TABLE dbo.table3
(
	Id INT, 
    Var1 VARCHAR(30),
	Var2 VARCHAR(30),
    vfd date,
    vtd date,
);
GO





/*
select *  from #table1_copy
union all
select *  from #table2_copy
*/



DECLARE @id_group int, @vfd1 date, @vtd1 date, @id1 INT, @var1 VARCHAR(30),
@vfd2 date, @vtd2 date, @id2 INT, @var2 VARCHAR(30);

SET @id_group = 0;
select * from dbo.table1 where id = @id_group
while @id_group < 100
begin 
	if not exists(select * from dbo.table1 where id = @id_group) and not exists(select * from dbo.table2 where id = @id_group)
	begin
		SET @id_group = @id_group + 1
		continue;
	end;
	
	select * 
	into #table1_copy
	from dbo.table1
	where id = @id_group

	--select * from #table1_copy

	select * 
	into #table2_copy
	from dbo.table2
	where id = @id_group

	while exists(select * from #table1_copy) AND exists(select * from #table2_copy)
	BEGIN
	
		SELECT TOP(1) @id1 = #table1_copy.Id,
				  @vfd1 = #table1_copy.vfd,
				  @vtd1 = #table1_copy.vtd,
				  @var1 = #table1_copy.var1 
		FROM #table1_copy
		SELECT TOP(1) @id2 = #table2_copy.Id,
				  @vfd2 = #table2_copy.vfd,
				  @vtd2 = #table2_copy.vtd,
				  @var2 = #table2_copy.var2
		FROM #table2_copy


	
		if @vtd2 <= @vtd1 and @vfd1 <= @vfd2
		begin
			--print 'less @vtd2'

			UPDATE TOP (1) #table1_copy 
			SET #table1_copy.vfd = @vtd2
			WHERE #table1_copy.vfd = @vfd1

			--select * from #table1_copy

			insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id2, @var1, @var2, convert(varchar(10), @vfd2), convert(varchar(10), @vtd2))
			DELETE TOP(1) FROM #table2_copy;
	
		end
		else if @vtd2 > @vtd1 and @vfd2 >= @vfd1
		begin
			--print 'less @@vfd1'
			/*if @vfd2 >= @vtd1
			begin
				insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var1, @var1, convert(varchar(10), @vfd1), convert(varchar(10), @vtd1))
				DELETE TOP(1) FROM #table1_copy;
				continue;
			end*/

			UPDATE TOP (1) #table2_copy 
			SET #table2_copy.vfd = @vtd1
			WHERE #table2_copy.vfd = @vfd2

			select * from #table1_copy
			--if @vfd2 = @vfd1
			--	insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var1, @var1, convert(varchar(10), @vfd1), convert(varchar(10), @vtd1))
			--else
			--begin
			--	insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var1, @var2, convert(varchar(10), @vfd1), convert(varchar(10), @vfd2))
				--if @vfd2 <> @vtd1
					insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var2, @var1, convert(varchar(10), @vfd2), convert(varchar(10), @vtd1))
			--end;
			DELETE TOP(1) FROM #table1_copy;
		end
		else if @vtd2 <= @vtd1 and @vfd2 < @vfd1
		begin

			/*if @vfd1 >= @vtd2
			begin
				insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id2, @var2, @var2, convert(varchar(10), @vfd2), convert(varchar(10), @vtd2))
				DELETE TOP(1) FROM #table2_copy;
				continue;
			end*/
			UPDATE TOP (1) #table1_copy 
			SET #table1_copy.vfd = @vtd2
			WHERE #table1_copy.vfd = @vfd1

			--if @vfd2 = @vfd1
			--	insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id2, @var2, @var2, convert(varchar(10), @vfd2), convert(varchar(10), @vtd2))
			--else
			--begin
			--	insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var2, @var1, convert(varchar(10), @vfd2), convert(varchar(10), @vfd1))
			--	if @vfd1 <> @vtd2
				insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var1, @var2, convert(varchar(10), @vfd1), convert(varchar(10), @vtd2))
			--end;
			DELETE TOP(1) FROM #table2_copy;
		end;
		else if @vtd2 >= @vtd1 and @vfd2 <= @vfd1
		begin
			--print 'less @vtd2'
		
				UPDATE TOP (1) #table1_copy 
				SET #table1_copy.vfd = @vtd2
				WHERE #table1_copy.vfd = @vfd1
		
			--select * from #table1_copy

			insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id2, @var2, @var2, convert(varchar(10), @vfd2), convert(varchar(10), @vtd2))
			DELETE TOP(1) FROM #table2_copy;
		end;
	


	END;

	while exists(select * from #table1_copy)
	BEGIN
		SELECT TOP(1) @id1 = #table1_copy.Id,
				  @vfd1 = #table1_copy.vfd,
				  @vtd1 = #table1_copy.vtd,
				  @var1 = #table1_copy.var1 
		FROM #table1_copy
		if @vfd1 <> @vtd1
		insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id1, @var1, @var1, convert(varchar(10), @vfd1), convert(varchar(10), @vtd1))
		DELETE TOP(1) FROM #table1_copy;
	END;
	while exists(select * from #table2_copy)
	BEGIN
		SELECT TOP(1) @id2 = #table2_copy.Id,
				  @vfd2 = #table2_copy.vfd,
				  @vtd2 = #table2_copy.vtd,
				  @var2 = #table2_copy.var2
		FROM #table2_copy
		if @vfd2 <> @vtd2
		insert into dbo.table3(Id, Var1, Var2, vfd, vtd) VALUES (@id2, @var2, @var2, convert(varchar(10), @vfd2), convert(varchar(10), @vtd2))
		DELETE TOP(1) FROM #table2_copy;
	END;

	SET @id_group = @id_group + 1;
	drop table dop.dbo.#table1_copy
	drop table dop.dbo.#table2_copy
end;


 
--PRINT '@id1 ' + STR(@id1) + ' @vfd1 ' + convert(varchar(10), @vfd1) + ' @vtd1 ' + convert(varchar(10), @vtd1)+ ' @var1 ' + @var1

select * from dbo.table3


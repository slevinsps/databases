USE Film_contract
GO
DROP PROCEDURE IncreaseBudget
go
CREATE PROCEDURE IncreaseBudget (@percent INT=5)
    AS UPDATE Films
    SET Gross = Gross + Gross * @percent/100;

go
--select * from films where id=1
--EXECUTE  IncreaseBudget 10
--select * from films where id=1



DROP PROCEDURE FACTORIAL_PROC
go
CREATE PROCEDURE FACTORIAL_PROC @NUM INT, @N_FACTORIAL INT OUTPUT
AS
DECLARE @NUM_LESS_ONE INT;
BEGIN
  IF (@NUM = 1)
  BEGIN /**** BASE CASE: 1 FACTORIAL IS 1 ****/
    SET @N_FACTORIAL = 1;
  END
  ELSE
  BEGIN /**** RECURSION: NUM FACTORIAL = NUM * (NUM-1) FACTORIAL ****/
    SET @NUM_LESS_ONE = @NUM - 1
	EXECUTE FACTORIAL_PROC @NUM=@NUM_LESS_ONE, @N_FACTORIAL=@N_FACTORIAL OUTPUT;

    SET @N_FACTORIAL = @N_FACTORIAL * @NUM;
  END
END;
go

--DECLARE @res INT;
--EXECUTE FACTORIAL_PROC @NUM=6, @N_FACTORIAL=@res OUTPUT;
--print @res
--go

DROP PROCEDURE dbo.BigRatingActorsCursor 
go
CREATE PROCEDURE dbo.BigRatingActorsCursor   
    @CurrencyCursor CURSOR VARYING OUTPUT  
AS  
    SET NOCOUNT ON;  
    SET @CurrencyCursor = CURSOR  
    FORWARD_ONLY STATIC FOR  
      SELECT name  
      FROM Actors where Rating > 80 
    OPEN @CurrencyCursor;  
GO 

--DECLARE @TableName varchar(255);
--DECLARE @MyCursor CURSOR;  
--
--EXEC dbo.BigRatingActorsCursor @CurrencyCursor = @MyCursor OUTPUT;  
--FETCH NEXT FROM @MyCursor INTO @TableName
--WHILE (@@FETCH_STATUS = 0)  
--BEGIN 
--	PRINT @TableName 
--     FETCH NEXT FROM @MyCursor INTO @TableName ;
--	  
--END;  
--CLOSE @MyCursor;  
--DEALLOCATE @MyCursor; 

DROP PROCEDURE dbo.MetaData 
go
CREATE PROCEDURE dbo.MetaData 
AS 
		SELECT DISTINCT sys.objects.name AS 'FuncName', sys.parameters.name AS 'Parameters' 
        FROM sys.objects JOIN sys.parameters ON sys.objects.object_id = sys.parameters.object_id
go
--EXECUTE  dbo.MetaData
USE Film_contract
GO
IF OBJECT_ID (N'dbo.MaxGross', N'FN') IS NOT NULL
    DROP FUNCTION dbo.MaxGross

GO
CREATE FUNCTION dbo.MaxGross()
RETURNS int
AS
BEGIN
       RETURN (SELECT MAX(Gross)  FROM dbo.Films )
END
GO

--SELECT dbo.MaxGross() as MaxGross

GO
--IF OBJECT_ID (N'dbo.USAfilms', N'FN') IS NOT NULL
--    DROP FUNCTION dbo.USAfilms
--GO
DROP FUNCTION dbo.USAfilms
GO
CREATE FUNCTION dbo.USAfilms()
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM Films where films.Country like 'usa'
    )
GO

--SELECT *
--FROM dbo.USAfilms()
--GO

--IF OBJECT_ID (N'dbo.BigStudios', N'FN') IS NOT NULL
DROP FUNCTION dbo.BigStudios
GO

CREATE FUNCTION dbo.BigStudios()
RETURNS @BigStudios_t TABLE 
(
    Name VARCHAR(30) NOT NULL,
	Country VARCHAR(30),  
    Employees_number int
)
AS
BEGIN
    INSERT INTO @BigStudios_t
    SELECT Studios.name, Studios.Country, Studios.Employees_number
    FROM Studios 
    WHERE Studios.Employees_number > 10000
RETURN
END
GO

--SELECT *
--FROM dbo.BigStudios()

DROP FUNCTION dbo.factorial
go
CREATE FUNCTION dbo.factorial (@n int)  
RETURNS int AS  
BEGIN 
  if @n = 1 
    return 1;

  return @n * dbo.factorial(@n - 1);
END
go

--select dbo.factorial(5);
USE Film_contract

--DROP TABLE AuditBudget
--GO
--CREATE TABLE AuditBudget (
--    FilmNumber VARCHAR(50) NULL,
--    BudgetOld INT NULL,
--    BudgetNew INT NULL
--);


GO
Drop TRIGGER Budget_trigger
GO

CREATE TRIGGER Budget_trigger
    ON Films AFTER UPDATE
    AS IF UPDATE(Budget)
BEGIN

    DECLARE @budgetOld INT
    DECLARE @budgetNew INT
    DECLARE @FilmTitle  VARCHAR(50)

    SELECT @budgetOld = (SELECT Budget FROM deleted)
    SELECT @budgetNew = (SELECT Budget FROM inserted)
    SELECT @FilmTitle = (SELECT Title FROM deleted)
	INSERT INTO AuditBudget VALUES
	    (@FilmTitle, @budgetOld, @budgetNew)

END

go

--UPDATE Films
--    SET Budget = 90
--    WHERE ID = '1';
--
--select * 
--from AuditBudget
drop TRIGGER film_insert
go
CREATE TRIGGER film_insert
ON Films
INSTEAD OF insert
AS
DECLARE @curGross INT
SET @curGross = (select Gross from inserted)
if @curGross > 80
begin
INSERT INTO Films(Title, Genre, Country, Year, Budget, Gross)
SELECT Title, Genre, Country, Year, Budget, Gross FROM inserted
end
else
begin 
print 'Это слишком малобюджетный фильм'
rollback
end
go
--INSERT INTO Films(Title, Genre, Country, Year, Budget, Gross) 
--Values ('Kill Bill', 'Fantasy', 'USA', '1990', 100, 100)

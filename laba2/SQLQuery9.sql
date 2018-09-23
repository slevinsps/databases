--scalar 
USE Film_contract
SELECT Title, Genre, Budget, Gross,
	CASE (Films.Gross-Films.Budget)
	    WHEN 0 THEN 'none'
		ELSE Gross-Budget
	END AS 'profit'
FROM Films
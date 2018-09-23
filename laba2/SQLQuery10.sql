--scalar 
USE Film_contract
SELECT *, 
	CASE 
	    WHEN Employees_number < 1000 THEN 'small'
		WHEN Employees_number > 10000 THEN 'big'
		ELSE 'middle'
	END AS 'Size'
FROM Studios
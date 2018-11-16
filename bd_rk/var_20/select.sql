USE [var_4]
GO

-- поисковое выражение CASE
SELECT DISTINCT 	first_name,				
				born_date,
				CASE 
					WHEN born_date	<= '1994' THEN 'Старый'	
					WHEN born_date	<= '1996' THEN 'Зрелый'	
					WHEN born_date	<= '1999' THEN 'Молодой'				
					ELSE 'Младенец'
				END AS 'Возраст'
FROM Buyer

-- инструкция UPDATE со скалярным подзапросом в предложении SET.
UPDATE Buyer
SET born_date  = (SELECT max(born_date)	FROM Buyer)		
WHERE ID = 1


-- GROUP BY c HAVING
SELECT COUNT(ID), city
FROM Buyer
GROUP BY city
HAVING COUNT(Id) > 1


	


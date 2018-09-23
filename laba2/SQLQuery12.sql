USE Film_contract
SELECT *
FROM Contracts
WHERE 'Spain' IN
			(SELECT Country
			From Films
		    WHERE id = Contracts.Film)

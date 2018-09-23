USE Film_contract

SELECT Fee, 
        Work_days
INTO #new_table
FROM Contracts
SELECT * FROM #new_table
DROP TABLE Film_contract.dbo.#new_table 
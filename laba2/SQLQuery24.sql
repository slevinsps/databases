USE Film_contract
SELECT Title, Country, MAX(Gross) over(partition by Country) As 'MAX gross'
FROM Films


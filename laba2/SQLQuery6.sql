USE Film_contract
SELECT Title, country, Budget
FROM Films
where Budget > ALL(
	select Budget
	from Films 
	where country like 'usa')
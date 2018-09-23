USE Film_contract
SELECT *
FROM Films
where EXISTS(
	select *
	from Films 
	where country like 'usa')
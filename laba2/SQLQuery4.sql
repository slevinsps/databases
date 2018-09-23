USE Film_contract
SELECT id, Name, Birthdate
FROM Actors
where id in (
	select Actor
	from Contracts 
	where Fee > 40000000)
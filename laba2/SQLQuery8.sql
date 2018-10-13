--scalar 
USE Film_contract
SELECT Title, Genre, Country, 
(SELECT MAX(Gross) FROM FILMS where f.Country like Country) as max_gross
FROM Films as f
WHERE Budget > 50 
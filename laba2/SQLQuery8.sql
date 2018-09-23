--scalar 
USE Film_contract
SELECT Title, Genre, Gross
FROM Films
WHERE Gross = (SELECT MAX(Gross) FROM FILMS )
USE Film_contract
SELECT Country, Count(Country) as Count_films, MAX(Gross) as max_gross
FROM Films
GROUP BY Country
HAVING MAX(Gross) > 900
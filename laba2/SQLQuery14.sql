USE Film_contract
SELECT Country, Count(Country) as Count_films, AVG(Gross) as avg_gross
FROM Films
GROUP BY Country
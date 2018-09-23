USE Film_contract
INSERT INTO Films (Title, Genre, Country, Year, Budget, Gross) 
select Films.Title, Films.Genre, Null, Null, Films.Budget, Null
from Films where Films.Budget > 150
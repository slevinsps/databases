with small_films (Title, Gross)
AS
(
	select films.Title, films.Gross
	from films
)
select *
from small_films

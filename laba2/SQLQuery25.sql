USE Film_contract

select Actors.name, Actors.Rating, ROW_NUMBER() over (partition by rating order by rating) as num

INTO #new_table
from Actors
go

delete 
from #new_table
where num > 1

SELECT * FROM #new_table
DROP TABLE Film_contract.dbo.#new_table 

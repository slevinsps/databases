use RK2
go
--предикат сравнения
--select * from dbo.Fine 
--where Fine_col > 1000

--SELECT *, ROW_NUMBER() OVER(ORDER BY Brand) num, 
--DENSE_RANK() OVER(ORDER BY Brand) rnk 
--FROM dbo.Avto;

SELECT *
FROM dbo.Driver
WHERE 'BMW' IN
			(SELECT Brand
			 From dbo.Avto
		     WHERE id = Driver.Avto)



USE Film_contract
go
with company_piram(id, Name, Country, Owner, Employees_number, Parent_company, level)
as
(
	select s.id, s.Name, s.Country, s.Owner, s.Employees_number, s.Parent_company, 0 as level
	from Studios as s
	where s.Parent_company is NULL
	union all
	select s.id, s.Name, s.Country, s.Owner, s.Employees_number, s.Parent_company, cp.level + 1
	from Studios as s
	inner join company_piram as cp on s.Parent_company=cp.id
)
select  * from company_piram order by level
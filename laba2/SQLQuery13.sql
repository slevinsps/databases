USE Film_contract
Select act_stud_contr.Actor_name, act_stud_contr.Birthdate, act_stud_contr.Fee, act_stud_contr.Work_days, Films.Title, Films.Gross, act_stud_contr.Studio
FROM (Select Studios.Name AS Studio, act_contr.Name as Actor_name, act_contr.Birthdate, act_contr.Fee, act_contr.Work_days, act_contr.Film
	FROM (
		SELECT Actors.Name, Actors.Birthdate, Contracts.Fee, Contracts.Work_days, Contracts.Film, Contracts.Studio
		From Actors join Contracts on Actors.id = Contracts.Actor
	) as act_contr join Studios on act_contr.Studio = Studios.ID
) as act_stud_contr join Films On Films.ID = act_stud_contr.Film
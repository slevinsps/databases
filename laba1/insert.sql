BULK INSERT Film_contract.dbo.Films
FROM 'C:\msys64\home\databases\film.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Actors
FROM 'C:\msys64\home\databases\actor.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Studios
FROM 'C:\msys64\home\databases\studio.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Contracts
FROM 'C:\msys64\home\databases\contract.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 
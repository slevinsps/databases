BULK INSERT Film_contract.dbo.Films
FROM 'C:\msys64\home\databases\laba1\film.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Actors
FROM 'C:\msys64\home\databases\laba1\actor.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Studios
FROM 'C:\msys64\home\databases\laba1\studio.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 

BULK INSERT Film_contract.dbo.Contracts
FROM 'C:\msys64\home\databases\laba1\contract.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',');
GO 
delete FROM Contracts
WHERE Contracts.Studio= (
    SELECT id
    FROM Studios
    WHERE Studios.Employees_number = 9952
)
USE [var_4]
GO

-- ��������� ��������� CASE
SELECT DISTINCT 	first_name,				
				born_date,
				CASE 
					WHEN born_date	<= '1994' THEN '������'	
					WHEN born_date	<= '1996' THEN '������'	
					WHEN born_date	<= '1999' THEN '�������'				
					ELSE '��������'
				END AS '�������'
FROM Buyer

-- ���������� UPDATE �� ��������� ����������� � ����������� SET.
UPDATE Buyer
SET born_date  = (SELECT max(born_date)	FROM Buyer)		
WHERE ID = 1


-- GROUP BY c HAVING
SELECT COUNT(ID), city
FROM Buyer
GROUP BY city
HAVING COUNT(Id) > 1


	


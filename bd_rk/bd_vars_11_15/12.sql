--� 12 
--������� �������� ��������� � �������� ����������, ������� �������
--����� �� ����� SQL ���� ��������� SQL ������� ������������ (�������
--���� 'FN') � ������� ���� ������, ����� ������� ���������� � ��������
--'ufn'. �������� �������� ���������� ���������� ��������� �������.
--��������� �������� ��������� ��������������. (����� �����)

DROP PROCEDURE dbo.Count_procs 
GO

CREATE PROCEDURE dbo.Count_procs 
AS
BEGIN
	DECLARE @count_procs int
	SELECT @count_procs = count(*)
	FROM sys.objects
	WHERE type = 'FN' AND CHARINDEX('ufn', name) = 1
	return @count_procs
END
GO


SELECT *
FROM sys.objects
WHERE type = 'FN' AND CHARINDEX('ufn', name) = 1

--DECLARE @count int
--EXEC @count = dbo.Count_procs 
--SELECT @count
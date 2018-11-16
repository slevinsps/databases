--������� 13
--������� �������� ��������� � �������� ����������, ������� ������� ������ ���� � 
--���������� ���� ��������� SQL ������� ������������ (������� ���� 'FN') � ������� ���� ������.
--����� ������� ��� ���������� �� ��������. ����� � ������ ���������� ������ ���������� � ���� ������.
--�������� �������� ���������� ���������� ��������� �������. ��������� �������� ��������� ��������������.

DROP FUNCTION dbo.MaxFine
go
CREATE FUNCTION dbo.MaxFine(@nnn int)
RETURNS int
AS
BEGIN
       RETURN (SELECT MAX(Fine_col)  FROM dbo.Fine )
END
GO

DROP FUNCTION dbo.MaxFine2
go
CREATE FUNCTION dbo.MaxFine2(@n int, @g int)
RETURNS int
AS
BEGIN
       RETURN (SELECT MAX(Fine_col)  FROM dbo.Fine )
END
GO

SELECT DISTINCT ob1.name, 
    SUBSTRING(
        (
            SELECT  par2.name + ','  AS [text()]
			FROM sys.parameters as par2
			where par2.object_id = ob1.object_id
            FOR XML PATH ('')
        ), 2, 1000) [Students]
FROM sys.objects as ob1 JOIN sys.parameters as par1 ON ob1.object_id = par1.object_id and LEN(par1.name) > 0
where type = 'FN' 


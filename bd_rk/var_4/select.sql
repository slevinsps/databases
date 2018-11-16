USE example
GO

-- ���������� SELECT, ������������ ������� ��������� CASE 
select ID , case 
	when   [��������] <= 5000 then '����������� ������� ����? ����, ������ ����.'
	when  [��������] <= 15000 then '�������� ������... ��� ���'
	when   [��������] <= 50000 then '100 ������� � ���!'
	when   [��������] <= 100000 then '��� ������ ������ ������������ �����.'
	else '��� �������������, �� ������������� ��:' + CAST([��������] AS nvarchar)
	end as 'what'
	from [���������]

-- ���������� ������������ ������� ������� 
select ID, [�����_ID], [��������],
	 AVG([��������])
		OVER(partition by [�����_ID])
		as '������� �������� �� ������',
	 MIN([��������])
		OVER(partition by [�����_ID])
		as '�����������',
	 MAX([��������])
		OVER(partition by [�����_ID])
		as '������������'
	from [���������]

--���������� SELECT, ��������������� ������ � �������
--����������� GROUP BY � ����������� HAVING 

-- ������� �����������, � ���� �������� ������ 60000
select [���], [��������]
	from [���������] as S join [�����] as O
	ON S.[�����_ID] = O.ID and S.ID = O.[����������]
	GROUP BY [��������], [���]
	HAVING [��������] > 60000

	


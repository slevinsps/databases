USE example
GO

--------------------------------------------------

insert into [C��M��] values (1,1)
insert into [C��M��] values (1,2)
insert into [C��M��] values (1,3)
insert into [C��M��] values (1,4)
insert into [C��M��] values (2,5)
insert into [C��M��] values (2,6)
insert into [C��M��] values (2,7)
insert into [C��M��] values (3,1)
insert into [C��M��] values (3,3)
insert into [C��M��] values (3,11)
insert into [C��M��] values (4,5)
insert into [C��M��] values (4,8)
insert into [C��M��] values (4,9)
insert into [C��M��] values (5,12)
insert into [C��M��] values (8,5)
insert into [C��M��] values (6,6)
insert into [C��M��] values (7,2)
insert into [C��M��] values (8,9)
insert into [C��M��] values (8,10)
insert into [C��M��] values (6,1)
insert into [C��M��] values (6,2)
insert into [C��M��] values (6,3)
insert into [C��M��] values (1,6)
insert into [C��M��] values (1,7)
insert into [C��M��] values (4,10)
insert into [C��M��] values (4,11)
insert into [C��M��] values (4,12)
insert into [C��M��] values (1,5)

insert into [����������] values
 ('��������������', '������. �������. ���������.', 1000)
insert into [����������] values
 ('���������', '������. ������. �������. ���������.', 1000000)
insert into [����������] values
 ('��', '������. �������. ������.', 500)
insert into [����������] values
 ('�����', '��� �����. ����� ������������!', 5000)
insert into [����������] values
 ('�������������', '������� ��� ������� ������ �����', 3000)
insert into [����������] values
 ('�����-���������', '����������� � ����� ����', 800)
insert into [����������] values
 ('������', '� ��� ��� ������? �� �����', 900)
insert into [����������] values
 ('���', '� ��� �����? ������ �������� ����?', 80000)

insert into [�����] values
 ('���� ������', '8-967-345-45-90', 1)
insert into [�����] values
 ('����� �������', '8-966-666-66-66', 8)
 insert into [�����] values
 ('������ ����', '8-967-345-45-90', 9)


insert into [���������] values
 (1, '����� ������', '������ ����', 100000)
 insert into [���������] values
 (1, '�������, �� ���������� ����', '�������� ��������� ����', 10000)
 insert into [���������] values
 (1, '�����������-��������������', '������� ', 3000)
 insert into [���������] values
 (1, '��������������', '���', 777777)
 insert into [���������] values
 (2, '������� ����� �������', '��������', 70000)
  insert into [���������] values
 (2, '������� ����� �������', '������� ��������', 14000)
  insert into [���������] values
 (2, '������� ����� �������', '���', 90000)
   insert into [���������] values
 (2, '������� �������', '�������', 90000)
  insert into [���������] values
 (3, '�����������', '����', 7000000)
  insert into [���������] values
 (3, '������������ �����', '����', 45000)
  insert into [���������] values
 (3, '��� ��� ������', '�����', 8000)
   insert into [���������] values
 (3, '���� �����', '������', 2000)
 
 -- ��������� ��� ����� ��������
alter table [���������]
	add constraint foreign_dol
		foreign key ([�����_ID])
		references [�����](ID)

alter table [�����]
	add constraint foreign_zav
		foreign key ([����������])
		references [���������](ID)
/*
alter table [���������]
	drop constraint foreign_dol
alter table [�����]
	drop constraint foreign_zav
*/
 
 

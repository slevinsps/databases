--  у меня  студент - оценка один к 1


CREATE DATABASE rk2_v3
go

use rk2_v3
go


CREATE TABLE Teacher 
(
ID int NOT NULL IDENTITY(1, 1),
NameSurnnameM VARCHAR(50) NOT NULL,
Stepen VARCHAR(50) NOT NULL,
Kaphedra VARCHAR(50) NOT NULL,
CONSTRAINT PK_Teacher PRIMARY KEY(ID),

)
GO

CREATE TABLE Theme
(
ID int NOT NULL  IDENTITY(1, 1),
teacher_id int NOT NULL,
theme VARCHAR(50) NOT NULL,
CONSTRAINT PK_Theme PRIMARY KEY(ID),
CONSTRAINT FK_techer_id	FOREIGN KEY (teacher_id) REFERENCES Teacher(ID)
)
go


CREATE TABLE Mark
(
ID int  NOT NULL IDENTITY(1, 1),
grad_numb int UNIQUE NOT NULL,
mark_EX int NOT NULL,
mark_diploma  int NOT NULL,
CONSTRAINT PK_Mark PRIMARY KEY(ID)
)

CREATE TABLE Student 
(
ID int  NOT NULL IDENTITY(1, 1),
grad_numb int NOT NULL,
NameSurnnameM VARCHAR(50) NOT NULL,
faculty VARCHAR(50) NOT NULL,
group_name VARCHAR(50) NOT NULL,
CONSTRAINT PK_Student PRIMARY KEY(ID),
CONSTRAINT FK_grad_numb_mark FOREIGN KEY (grad_numb) REFERENCES Mark(grad_numb)
)
GO

CREATE TABLE Teacher_for_Student
(
id_student int NOT NULL,
id_teacher int NOT NULL
CONSTRAINT PK_for_student PRIMARY KEY(id_student)
CONSTRAINT FK_student FOREIGN KEY (id_student) REFERENCES Student(ID),
CONSTRAINT FK_teacher FOREIGN KEY (id_teacher) REFERENCES Teacher(ID)
)
GO

---------------- inserts 

BULK INSERT rk2_v3.dbo.Teacher
FROM 'D:\sem_5\database\rk2_v3\teacher.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
GO 

INSERT Teacher(NameSurnnameM, Stepen, Kaphedra)
VALUES ('Olga Kia Olegovna', 'doktor', 'ui7'),
('Olga Kva Olegovna', 'doktor', 'ui7'),
('Olga Xor Olegovna', 'doktor', 'ui7'),
('Olga Not Olegovna', 'doktor', 'ui4'),
('Inna Zelen Olegovna', 'docent', 'ui5'),
('Inna DR Olegovna', 'docent', 'ui4'),
('inna Zelen Olegovna', 'docent', 'ui7'),
('Ivan Zelen Olegich', 'doktor', 'ui7'),
('Olga Zelen ivanovna', 'doktor', 'ui7'),
('qwerty cer ivanovna', 'docent', 'ui7'),
('dana evreika ivanovna', 'doktor', 'ui7')
GO 
INSERT Theme(teacher_id, theme)
VALUES (1, 'zhivotnie i rastenia'),
       (1, 'gribi'),
	   (3, 'zhivotnie i rastenia'),
	   (4, 'eucarioti'),
	   (4, 'procarioti'),
	   (5, 'gribi'),
	   (6, 'eucarioti'),
	   (10, 'eucarioti'),
	   (8, 'fotosintez'),
	   (7, 'fotosintez')

INSERT Mark(grad_numb, mark_EX, mark_diploma)
VALUES (1, 3, 4),
	   (2, 3, 4),
	   (3, 5, 4),
	   (4, 5, 5),
	   (5, 5, 4),
	   (6, 3, 4),
	   (8, 3, 4),
	   (7, 3, 4),
	   (9, 4, 4),
	   (10, 5, 3)

INSERT Student(NameSurnnameM, grad_numb, faculty, group_name)
VALUES ('Ananastya Kolesova Vladislavovna', 1, 'ui', 'ui7-53'),
		('Ananastya Ivanova Vladislavovna', 2, 'ui', 'ui7-53'),
		('Ananastya Kva Vladislavovna', 3, 'ui', 'ui7-53'),
		('Ananastya kol Vladislavovna', 4, 'ui', 'ui7-53'),
		('Ananastya Kolesova Vladislavovna', 5, 'ui', 'ui7-56'),
		('Ananastya Ktrww Vladislavovna', 6, 'ui', 'ui7-53'),
		('Ananastya Sieorova Vladislavovna', 7, 'ui', 'ui7-53'),
		('Ananastya Fedorova Vladislavovna', 8, 'ui', 'ui7-53'),
		('Ananastya File Vladislavovna', 9, 'ui', 'ui7-53'),
		('Ananastya DER Vladislavovna', 10, 'ui', 'ui7-43')

INSERT Teacher_for_Student(id_student, id_teacher)
VALUES (1, 2),
		(2, 2),
		(3, 3),
		(4, 2),
		(5, 6),
		(6, 6),
		(7, 5),
		(8, 7),
		(9, 2),
		(10, 9)

----- select

-- предикат сравнения с квантором квантор нарпимер ALL
-- ребенок с самой большой оценкой в дипломе
SELECT *
FROM Student INNER JOIN Mark ON ( Student.grad_numb = Mark.grad_numb)
WHERE mark_diploma >= ALL
(
	SELECT mark_diploma
	FROM Student INNER JOIN Mark ON ( Student.grad_numb = Mark.grad_numb)
)
GO

-- Инструкция SELECT, использующая агрегатные функции в
--выражениях столбцов
-- количество учеников у учителя под номером 2
SELECT Count(*)
FROM Teacher INNER JOIN Teacher_for_Student ON (ID = id_teacher)
WHERE id_teacher = 2


--Создание новой временной локальной таблицы из результирующего
--набора данных инструкции SELECT 

SELECT *
INTO #local_table
FROM Teacher INNER JOIN Teacher_for_Student ON (ID = id_teacher)
GO
SELECT *
FROM #local_table
GO

--Создать хранимую процедуру с выходным параметром, которая выводит
--текст на языке SQL всех скалярных SQL функций пользователя (функции
--типа 'FN') в текущей базе данных, имена которых начинаются с префикса
--'ufn'. Выходной параметр возвращает количество найденных функций.
--Созданную хранимую процедуру протестировать. 

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

DECLARE @count int
EXEC @count = dbo.Count_procs 
SELECT @count
USE [var_4]
GO

--------------------------------------------------

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '������', '�����������', 1122, '8-925-872-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '���', '���', 5555, '8-925-872-22-78')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '������', '����', 8122, '8-925-872-58-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '������', '��', 5656, '8-958-999-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('������', '��', '��', 3535, '8-999-872-22-85')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '���', '������', 9876, '8-925-872-26-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '���', '����', 1414, '8-925-836-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '���', '���', 1418, '8-925-555-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('���', '��', '��', 1951, '8-999-872-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('����', '��', '��', 4682, '8-999-872-22-15')
GO 

--------------------------------------------------

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (2, '�����')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (9, '����')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (1, '���������')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (10, '������')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (4, '�������')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (6, '�����')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (5, '���')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (3, '������')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (8, '��������')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (7, '������')
GO 

--------------------------------------------------

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('����', '1998', '������', '8-925-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('����', '1995', '������', '8-999-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('����', '1999', '������', '8-925-871-56-84')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('����', '1995', '�����', '8-988-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('����', '1993', '�����', '8-925-555-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('���', '2000', '������', '8-925-111-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('�������', '1998', '������', '8-925-871-69-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('���', '1996', '������', '8-926-656-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('�����', '1999', '������', '8-925-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('��������', '1986', '������', '8-925-871-56-85')
GO 

--------------------------------------------------

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (1, 5)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (2, 5)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (9, 5)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (9, 4)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (5, 5)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (9, 1)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (3, 4)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (5, 6)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (9, 2)
GO 

INSERT INTO Buyer_Florist(ID_buyer, ID_florist)
VALUES (4, 10)
GO 

USE [var_4]
GO

--------------------------------------------------

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Артём', 'Евтеев', 'Бахтиярович', 1122, '8-925-872-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Нина', 'ква', 'ква', 5555, '8-925-872-22-78')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Волк', 'Евтеев', 'Сова', 8122, '8-925-872-58-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Иван', 'Евтеев', 'Ёж', 5656, '8-958-999-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Корова', 'Са', 'ВУ', 3535, '8-999-872-22-85')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Папа', 'Рок', 'Ивоноа', 9876, '8-925-872-26-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Артём', 'Рак', 'Муму', 1414, '8-925-836-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Мама', 'Зум', 'Зум', 1418, '8-925-555-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Лол', 'Ва', 'ня', 1951, '8-999-872-22-15')
GO 

INSERT INTO Florist(first_name, surname, middle_name	, passport_num, phone_num)
VALUES ('Артём', 'Ва', 'Йф', 4682, '8-999-872-22-15')
GO 

--------------------------------------------------

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (2, 'Мафия')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (9, 'Сова')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (1, 'Бриллиант')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (10, 'Цветок')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (4, 'Изумруд')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (6, 'Рубин')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (5, 'Дом')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (3, 'Любовь')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (8, 'Нежность')
GO 

INSERT INTO Bouquet(	author_ID, bouq_name	)
VALUES (7, 'Собака')
GO 

--------------------------------------------------

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Артём', '1998', 'Москва', '8-925-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Иван', '1995', 'Москва', '8-999-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Вова', '1999', 'Берлин', '8-925-871-56-84')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Катя', '1995', 'Париж', '8-988-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Нина', '1993', 'Париж', '8-925-555-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Ира', '2000', 'Москва', '8-925-111-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Дмитрий', '1998', 'Берлин', '8-925-871-69-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Аня', '1996', 'Москва', '8-926-656-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Игорь', '1999', 'Москва', '8-925-871-56-85')
GO 

INSERT INTO Buyer(first_name, born_date, city, phone_num)
VALUES ('Афанасий', '1986', 'Рязань', '8-925-871-56-85')
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

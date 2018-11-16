USE example
GO

--------------------------------------------------

insert into [CотMед] values (1,1)
insert into [CотMед] values (1,2)
insert into [CотMед] values (1,3)
insert into [CотMед] values (1,4)
insert into [CотMед] values (2,5)
insert into [CотMед] values (2,6)
insert into [CотMед] values (2,7)
insert into [CотMед] values (3,1)
insert into [CотMед] values (3,3)
insert into [CотMед] values (3,11)
insert into [CотMед] values (4,5)
insert into [CотMед] values (4,8)
insert into [CотMед] values (4,9)
insert into [CотMед] values (5,12)
insert into [CотMед] values (8,5)
insert into [CотMед] values (6,6)
insert into [CотMед] values (7,2)
insert into [CотMед] values (8,9)
insert into [CотMед] values (8,10)
insert into [CотMед] values (6,1)
insert into [CотMед] values (6,2)
insert into [CотMед] values (6,3)
insert into [CотMед] values (1,6)
insert into [CотMед] values (1,7)
insert into [CотMед] values (4,10)
insert into [CотMед] values (4,11)
insert into [CотMед] values (4,12)
insert into [CотMед] values (1,5)

insert into [Медикамент] values
 ('Обезболивающее', 'Живите. Выпейти. Повторить.', 1000)
insert into [Медикамент] values
 ('Оживитель', 'Живите. Умрите. Вколите. Повторить.', 1000000)
insert into [Медикамент] values
 ('Яд', 'Живите. Вколите. Умрите.', 500)
insert into [Медикамент] values
 ('Бинты', 'Это бинты. Самые обыкновенные!', 5000)
insert into [Медикамент] values
 ('Адренолинолин', 'Выпейти две третьих чайной ложки', 3000)
insert into [Медикамент] values
 ('Грибы-глюкогены', 'Употреблять в сыром виде', 800)
insert into [Медикамент] values
 ('Виагра', 'А она тут откуда? Ну ладно', 900)
insert into [Медикамент] values
 ('Сом', 'А что потом? Ловить снежинки ртом?', 80000)

insert into [Отдел] values
 ('Пати героев', '8-967-345-45-90', 1)
insert into [Отдел] values
 ('Элита демонов', '8-966-666-66-66', 8)
 insert into [Отдел] values
 ('Второй план', '8-967-345-45-90', 9)


insert into [Сотрудник] values
 (1, 'Хикки комори', 'Казума Сато', 100000)
 insert into [Сотрудник] values
 (1, 'Танкует, не испытывает боль', 'Лалатина Дастинесс Форд', 10000)
 insert into [Сотрудник] values
 (1, 'Террористка-взрывательница', 'Мэгумин ', 3000)
 insert into [Сотрудник] values
 (1, 'Бесполезногиня', 'Ака', 777777)
 insert into [Сотрудник] values
 (2, 'Генерал армии демонов', 'Ванилька', 70000)
  insert into [Сотрудник] values
 (2, 'Генерал армии демонов', 'Вельдия Дуллахан', 14000)
  insert into [Сотрудник] values
 (2, 'Генерал армии демонов', 'Виз', 90000)
   insert into [Сотрудник] values
 (2, 'Владыка демонов', 'Спойлер', 90000)
  insert into [Сотрудник] values
 (3, 'Полезногиня', 'Эрис', 7000000)
  insert into [Сотрудник] values
 (3, 'Неадекватная бабёна', 'Сэна', 45000)
  insert into [Сотрудник] values
 (3, 'Кто это вообще', 'Хайнц', 8000)
   insert into [Сотрудник] values
 (3, 'Друг хикки', 'Тейлор', 2000)
 
 -- Применять это после инсертов
alter table [Сотрудник]
	add constraint foreign_dol
		foreign key ([Отдел_ID])
		references [Отдел](ID)

alter table [Отдел]
	add constraint foreign_zav
		foreign key ([Заведующий])
		references [Сотрудник](ID)
/*
alter table [Сотрудник]
	drop constraint foreign_dol
alter table [Отдел]
	drop constraint foreign_zav
*/
 
 

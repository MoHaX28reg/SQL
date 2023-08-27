DROP TABLE IF EXISTS car;
CREATE TABLE IF NOT EXISTS car
(
	REGNUM INT PRIMARY KEY,
    MARK VARCHAR(40),
    COLOR VARCHAR(40),
    RELEASEDT DATE,
    PHONENUM BIGINT
);
INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO car (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM car;


-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR,	COUNT(COLOR)
	FROM car
	WHERE MARK = "BMW" OR MARK = "LADA"
GROUP BY 1, 2;


-- Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки

SELECT MARK, 8-COUNT(MARK)
  FROM car
  GROUP BY MARK;

/*Задание № 3 Напишите запрос, который вернет строки из таблицы test_a, 
id которых нет в таблице test_b, НЕ используя ключевого слова NOT.*/  

create table test_a (id INT, data VARCHAR(5));

create table test_b (id INT);

insert into test_a(id, data) values
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
insert into test_b(id) values
	(10),
	(30),
	(50);
    
SELECT * FROM test_a
	LEFT JOIN test_b
    ON test_a.id = test_b.id
    WHERE  test_b.id IS NULL;
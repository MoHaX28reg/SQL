/*1 Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, 
с помощью которой можно переместить любого (одного) пользователя из таблицы 
users в таблицу users_old. (использование транзакции с выбором commit или 
rollback – обязательно).*/ 

CREATE TABLE IF NOT EXISTS users
(
	id INT NOT NULL PRIMARY KEY,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    email VARCHAR(40)
);

INSERT INTO users (id, firstname, lastname, email)
VALUES 
	(1, 'Дмитрий', 'Дмитриев', 'dima@mail.ru'),
    (2, 'Иванов', 'Иван', 'vanya@mail.ru'),
    (3, 'Сергеев', 'Сергей', 'sergey@mail.ru');
    
SELECT * FROM users;

CREATE TABLE IF NOT EXISTS old_users
(
	id INT NOT NULL PRIMARY KEY,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    email VARCHAR(40)
);

DROP PROCEDURE IF EXISTS sp_user_move;
DELIMITER //
CREATE PROCEDURE sp_user_move(id_users BIGINT)
BEGIN
	START TRANSACTION; 
	INSERT INTO old_users SELECT id, firstname, lastname, email FROM users WHERE id = id_users;
	DELETE FROM users WHERE id = id_users LIMIT 1;
	COMMIT;
END//
DELIMITER ;

CALL sp_user_move(2);
SELECT * FROM old_users;

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".*/

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello(this_time VARCHAR(20))
RETURNS VARCHAR(20) DETERMINISTIC 
BEGIN
  DECLARE hello VARCHAR(20);
      SET hello = 
        IF(TIME(this_time) BETWEEN '06:00:00' AND '11:59:59', 'Доброе утро',
			( IF(TIME(this_time) BETWEEN '12:00:00' AND '17:59:59', 'Добрый день',
				( IF(TIME(this_time) BETWEEN '18:00:00' AND '23:59:59', 'Добрый вечер', 'Доброй ночи') ) ) ) );
RETURN hello;
END//
DELIMITER ;

SELECT hello('11:00:21');
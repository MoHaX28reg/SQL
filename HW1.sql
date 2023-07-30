SELECT * FROM homework1.phones;

/*Выведите название, производителя и цену для товаров,
количество которых превышает 2 */
SELECT Manufacturer, Price FROM homework1.phones WHERE ProductCount >= 2;

/*Выведите весь ассортимент товаров марки “Samsung”*/
SELECT * FROM homework1.phones where Manufacturer = "Samsung";

/*С помощью регулярных выражений найти:
4.1. Товары, в которых есть упоминание "Iphone"*/
SELECT * FROM homework1.phones WHERE ProductName like "iPhone%";

/*Samsung*/
SELECT * FROM homework1.phones WHERE manufacturer like "Samsung";

/*Товары, в которых есть ЦИФРЫ*/
SELECT * FROM homework1.phones WHERE ProductName REGEXP '[[:digit:]]' = 1 ;

/*Товары, в которых есть ЦИФРА "8" */
SELECT * FROM homework1.phones WHERE ProductName like "%8%";
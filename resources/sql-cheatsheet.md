# SQL Шпаргалка

## Основные операторы
SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, JOIN

## JOIN
INNER JOIN — только совпадения
LEFT JOIN — все из левой + совпадения
RIGHT JOIN — все из правой + совпадения

## Агрегатные функции
COUNT, SUM, AVG, MAX, MIN

## Проверка данных
Дубликаты: SELECT field, COUNT(*) FROM table GROUP BY field HAVING COUNT(*) > 1;
NULL: SELECT * FROM table WHERE field IS NULL;
Аномалии: SELECT * FROM table WHERE amount < 0;

# DBeaver — практика

## Подключение к БД
1. Открыть DBeaver
2. Нажать "New Database Connection" (плюсик)
3. Выбрать тип БД (PostgreSQL, MySQL, SQLite)
4. Ввести параметры: Host, Port, Database, Username, Password
5. Нажать "Test Connection" → "Finish"

## Просмотр таблиц
- В левой панели развернуть подключение → Tables
- Правая кнопка → "View Data"

## Выполнение SQL-запросов
- Нажать "SQL Editor"
- Написать запрос → "Execute" (Ctrl+Enter)

## Практические запросы
```sql
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'users';
SELECT COUNT(*) FROM orders;
SELECT AVG(total) FROM orders;
SELECT status, COUNT(*) FROM orders GROUP BY status;
Источник: вебинар 22.06.2026

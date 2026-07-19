# DBeaver — проводник по базам данных

## Для чего
- Подключение к БД (PostgreSQL, MySQL, и др.)
- Просмотр структуры таблиц
- Выполнение SQL-запросов
- Проверка данных

## Как использовать
1. Подключиться к БД (хост, порт, логин, пароль)
2. Выбрать таблицу → правая кнопка → Generate SQL → SELECT
3. Скопировать SQL-запрос → выполнить
4. Посмотреть результаты в таблице

## SQL-запросы для аналитика
```sql
-- Посмотреть всех пользователей
SELECT * FROM users;

-- Найти дубликаты email
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 1;

-- Посмотреть заказы за последний месяц
SELECT * FROM orders WHERE created_at > NOW() - INTERVAL '30 days';
-- Количество заказов по статусам
SELECT status, COUNT(*) FROM orders GROUP BY status;

-- Топ-5 самых популярных товаров
SELECT product_id, COUNT(*) as sales 
FROM order_items 
GROUP BY product_id 
ORDER BY sales DESC 
LIMIT 5;

-- Средний чек за неделю
SELECT AVG(total) FROM orders 
WHERE created_at > NOW() - INTERVAL '7 days';
-- Найти NULL в обязательных полях
SELECT * FROM users WHERE phone IS NULL;

-- Найти заказы без привязки к пользователю
SELECT * FROM orders WHERE user_id IS NULL;
Источник: вебинар 22.06.2026

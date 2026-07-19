# SQL — основы для аналитика

## Что такое SQL
SQL (Structured Query Language) — язык для работы с реляционными базами данных.

## Типы запросов

| Операция | Команда | Назначение |
|----------|---------|------------|
| Чтение | SELECT | Получить данные из таблицы |
| Создание | INSERT | Добавить новую запись |
| Обновление | UPDATE | Изменить существующую запись |
| Удаление | DELETE | Удалить запись |

## Базовый SELECT
```sql
SELECT * FROM users;
SELECT id, name, email FROM users;
SELECT * FROM users WHERE age > 18;
SELECT * FROM orders ORDER BY created_at DESC;
SELECT * FROM products LIMIT 10;
SELECT * FROM users WHERE status = 'active';
SELECT * FROM users WHERE name LIKE 'А%';
SELECT * FROM orders WHERE total BETWEEN 1000 AND 5000;
SELECT * FROM orders WHERE status IN ('new', 'processing');
SELECT * FROM users WHERE phone IS NOT NULL;
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'users';
SELECT COUNT(*) FROM orders;
SELECT AVG(total) FROM orders;
SELECT status, COUNT(*) FROM orders GROUP BY status;
-- INNER JOIN
SELECT orders.id, users.name, orders.total
FROM orders INNER JOIN users ON orders.user_id = users.id;

-- LEFT JOIN
SELECT orders.id, users.name, orders.total
FROM orders LEFT JOIN users ON orders.user_id = users.id;
SELECT DATE(created_at), COUNT(*) FROM orders GROUP BY DATE(created_at);
SELECT users.name, SUM(orders.total) as total_spent
FROM orders JOIN users ON orders.user_id = users.id
GROUP BY users.id ORDER BY total_spent DESC LIMIT 5;
SELECT * FROM orders WHERE total > (SELECT AVG(total) FROM orders);
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 1;
SELECT * FROM orders WHERE user_id IS NULL;
SELECT * FROM users WHERE phone NOT LIKE '+7%';
Источник: лекция «Работа с данными»

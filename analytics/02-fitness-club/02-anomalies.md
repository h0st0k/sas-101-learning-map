# Поиск аномалий

## 1. Платежи > 3× среднего
WITH stats AS (
  SELECT AVG(amount) AS avg_amount FROM payments
)
SELECT * FROM payments, stats
WHERE amount > avg_amount * 3;

## 2. Переполненные занятия
SELECT cl.id, cl.name, cl.max_capacity, COUNT(b.id) AS booked
FROM classes cl
JOIN bookings b ON cl.id = b.class_id
WHERE b.status = 'active'
GROUP BY cl.id, cl.name, cl.max_capacity
HAVING COUNT(b.id) > cl.max_capacity;

## 3. Дубликаты телефонов
SELECT phone, COUNT(*) FROM clients GROUP BY phone HAVING COUNT(*) > 1;

## 4. Платежи с отрицательной суммой
SELECT * FROM payments WHERE amount < 0;

## 5. Активные абонементы с истёкшим сроком
SELECT * FROM memberships 
WHERE status = 'active' AND end_date < CURRENT_DATE;

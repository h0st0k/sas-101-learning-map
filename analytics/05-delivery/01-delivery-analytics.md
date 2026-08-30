# Анализ доставки

## Цель
Анализ времени доставки и популярности блюд.

## Запросы

### 1. Среднее время доставки по районам
SELECT 
  district,
  AVG(delivery_time_minutes) AS avg_delivery_time,
  COUNT(*) AS orders_count
FROM orders
GROUP BY district
ORDER BY avg_delivery_time;

### 2. Топ-10 самых популярных блюд
SELECT 
  d.name,
  COUNT(oi.id) AS order_count,
  SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN dishes d ON oi.dish_id = d.id
GROUP BY d.id, d.name
ORDER BY total_sold DESC
LIMIT 10;

## Вопросы для анализа
1. В каком районе самая быстрая доставка?
2. Какие блюда приносят больше всего выручки?
3. Какие блюда чаще всего заказывают повторно?

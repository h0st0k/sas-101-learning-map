# Анализ работы салона

## Цель
Анализ загрузки мастеров и популярности услуг.

## Запросы

### 1. Загрузка мастеров
SELECT 
  m.name AS master_name,
  COUNT(b.id) AS bookings_count,
  AVG(b.duration_minutes) AS avg_duration,
  COUNT(DISTINCT b.client_id) AS unique_clients
FROM masters m
LEFT JOIN bookings b ON m.id = b.master_id
WHERE b.status != 'cancelled'
GROUP BY m.id, m.name
ORDER BY bookings_count DESC;

### 2. Популярность услуг
SELECT 
  s.name AS service_name,
  COUNT(b.id) AS bookings_count,
  SUM(b.price) AS total_revenue
FROM services s
LEFT JOIN bookings b ON s.id = b.service_id
WHERE b.status != 'cancelled'
GROUP BY s.id, s.name
ORDER BY bookings_count DESC;

### 3. Анализ неявок
SELECT 
  m.name AS master_name,
  COUNT(CASE WHEN b.status = 'no_show' THEN 1 END) AS no_shows,
  COUNT(b.id) AS total_bookings,
  ROUND(100.0 * COUNT(CASE WHEN b.status = 'no_show' THEN 1 END) / COUNT(b.id), 2) AS no_show_percent
FROM masters m
LEFT JOIN bookings b ON m.id = b.master_id
GROUP BY m.id, m.name
ORDER BY no_show_percent DESC;

## Вопросы для анализа
1. Какой мастер самый загруженный?
2. Какая услуга самая популярная?
3. У кого из мастеров самый высокий процент неявок?

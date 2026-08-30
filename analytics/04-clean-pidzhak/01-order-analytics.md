# Анализ заказов

## Цель
Анализ загрузки точек химчистки и сроков выполнения.

## Запрос
SELECT 
  p.name AS point_name,
  COUNT(o.id) AS orders_count,
  AVG(o.completion_days) AS avg_completion_days,
  COUNT(DISTINCT o.client_id) AS unique_clients
FROM points p
LEFT JOIN orders o ON p.id = o.point_id
WHERE o.status != 'cancelled'
GROUP BY p.id, p.name
ORDER BY orders_count DESC;

## Вопросы для анализа
1. Какая точка самая загруженная?
2. Какая точка самая быстрая?
3. Какие клиенты чаще всего возвращаются?

# Анализ загрузки производства

## Цель
Определить загрузку производственных мощностей.

## Запрос
SELECT 
  p.period,
  COUNT(o.id) AS orders_count,
  AVG(o.completion_time) AS avg_completion_time
FROM production p
JOIN orders o ON p.id = o.production_id
GROUP BY p.period
ORDER BY p.period;

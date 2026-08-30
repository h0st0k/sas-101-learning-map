# Анализ загрузки станций

## Цель
Определить, какие станции перегружены, а какие недогружены.

## SQL-запрос
SELECT 
  s.name,
  COUNT(r.id) AS rentals_count,
  s.capacity,
  s.capacity - COUNT(r.id) AS free_bikes
FROM stations s
LEFT JOIN rentals r ON s.id = r.station_id AND r.status = 'active'
GROUP BY s.id, s.name, s.capacity
ORDER BY rentals_count DESC;

## Вопросы для анализа
1. Какие станции требуют пополнения велосипедов?
2. Какие станции можно закрыть или переместить?
3. В какое время суток максимальная загрузка?

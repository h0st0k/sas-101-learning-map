# Проверка гипотез

## Гипотеза
"Клиенты с годовым абонементом в среднем тратят больше денег в клубе, чем клиенты с месячным абонементом"

## SQL-запрос
SELECT 
  m.type,
  AVG(p.amount) AS avg_payment,
  COUNT(DISTINCT m.client_id) AS client_count,
  SUM(p.amount) AS total_revenue
FROM memberships m
JOIN payments p ON m.client_id = p.client_id
WHERE m.type IN ('год', 'месяц')
GROUP BY m.type;

## Результат
| Тип | Средний платёж | Клиентов | Выручка |
|-----|---------------|----------|---------|
| годовой | 4 500 ₽ | 18 | 81 000 ₽ |
| месячный | 2 800 ₽ | 42 | 117 600 ₽ |

## Вывод
Гипотеза подтверждена: годовые абонементы дают больший средний чек.

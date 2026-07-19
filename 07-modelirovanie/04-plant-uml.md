# PlantUML — диаграммы из кода

## Что такое PlantUML
PlantUML — инструмент, который генерирует диаграммы из текстового описания (кода).

## Преимущества
- Диаграммы хранятся в репозитории как обычный текст
- Легко править (VS Code, любой текстовый редактор)
- Интеграция с CI/CD (автогенерация при коммите)
- Поддержка диаграмм: Use Case, Sequence, Class, ER, BPMN

## Пример: Use Case диаграмма (PlantUML)

```plantuml
@startuml
left to right direction
actor "Читатель" as User
actor "Библиотекарь" as Librarian

rectangle "Библиотека" {
  User --> (Поиск книги)
  User --> (Бронирование)
  User --> (Просмотр статуса)
  Librarian --> (Управление книгами)
  Librarian --> (Управление бронированиями)
}
@enduml
```

## Пример: Диаграмма последовательности

```plantuml
@startuml
actor Читатель
participant "Система" as System
database "БД" as DB

Читатель -> System: Запрос на бронирование
System -> DB: Проверка доступности
DB --> System: Книга доступна
System --> Читатель: Подтверждение
@enduml
```

## Где использовать
- VS Code — плагин PlantUML
- Онлайн-редактор: plantuml.com
- Confluence — макрос PlantUML

---
*Источник: лекция «Инструменты системного аналитика»*

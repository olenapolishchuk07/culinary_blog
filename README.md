# 🍲 Смачні Нотатки — Кулінарний Блог

Ruby on Rails застосунок з повним CRUD для ведення кулінарного щоденника.

## ✅ Функціонал

- **Перегляд** усіх постів з фільтрацією та пошуком
- **Створення** нового рецепту / запису
- **Редагування** існуючого запису
- **Видалення** запису з підтвердженням
- Категорії: Рецепти, Інгредієнти, Заклади, Інше
- Теги (через кому)

## 🗂 Структура проєкту

```
culinary_blog/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   └── posts_controller.rb      ← весь CRUD тут
│   ├── models/
│   │   └── post.rb                  ← валідації, хелпери
│   ├── views/
│   │   ├── layouts/
│   │   │   └── application.html.erb ← шапка, flash-повідомлення
│   │   └── posts/
│   │       ├── index.html.erb       ← список постів + фільтри
│   │       ├── show.html.erb        ← повний перегляд поста
│   │       ├── new.html.erb         ← форма створення
│   │       ├── edit.html.erb        ← форма редагування
│   │       └── _form.html.erb       ← спільна форма (partial)
│   └── assets/
│       └── stylesheets/
│           └── application.css      ← весь CSS
├── config/
│   └── routes.rb                    ← resources :posts + root
├── db/
│   ├── migrate/
│   │   └── 20260101000000_create_posts.rb
│   └── seeds.rb                     ← тестові дані
└── Gemfile
```

## 🚀 Як запустити локально

```bash
# 1. Встанови залежності
bundle install

# 2. Створи базу даних і запусти міграції
rails db:create db:migrate

# 3. (Необов'язково) Завантаж тестові дані
rails db:seed

# 4. Запусти сервер
rails server

# Відкрий у браузері: http://localhost:3000
```

## 📤 Як викласти на GitHub

### Перший раз (ініціалізація)
```bash
# У папці проєкту:
git init
git add .
git commit -m "Initial commit: culinary blog CRUD"

# Створи репозиторій на github.com, потім:
git remote add origin https://github.com/ТВІЙ_НІКНЕЙМ/culinary-blog.git
git branch -M main
git push -u origin main
```

### Після змін (звичайний workflow)
```bash
git add .
git commit -m "Опиши що змінила"
git push
```

## 📋 Маршрути (routes)

| HTTP метод | URL            | Дія        | Опис                   |
|-----------|----------------|------------|------------------------|
| GET       | /posts         | index      | Список усіх постів     |
| GET       | /posts/new     | new        | Форма створення        |
| POST      | /posts         | create     | Зберегти новий пост    |
| GET       | /posts/:id     | show       | Переглянути пост       |
| GET       | /posts/:id/edit| edit       | Форма редагування      |
| PATCH     | /posts/:id     | update     | Зберегти зміни         |
| DELETE    | /posts/:id     | destroy    | Видалити пост          |

## 🎯 Що здавати викладачу

Посилання на GitHub репозиторій у форматі:
`https://github.com/твій-нікнейм/culinary-blog`

Переконайся що в репо є:
- [ ] Усі файли (без `node_modules`, без `.env`)
- [ ] `README.md` з описом
- [ ] `.gitignore` (Rails генерує автоматично)

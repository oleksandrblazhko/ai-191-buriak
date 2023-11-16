## Кроки:

### 1. Заповніть таблицю БД ще трьома рядками.
![Снимок экрана (66)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/2c026ebf-2cd6-4ea8-8d6e-a91281075b64)

### 2. Створіть схему даних користувача, назва якої співпадає з назвою користувача, та створіть віртуальну таблицю у цій схемі з правилами вибіркового керування доступом для користувача так, щоб він міг побачити тільки деякі з рядків таблиці з урахуванням одного значення її останнього стовпчика.
![Снимок экрана (67)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/9105c1a4-1828-4748-bfa4-de3197665f73)

### 3. Встановіть з’єднання з СКБД від імені нового користувача
![Снимок экрана (57)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/321a29dd-8548-45c5-bfff-0aa20904b1a8)

### 4. Перевірте роботу механізму вибіркового керування, виконавши операцію SELECT до віртуальної таблиці.
![Снимок экрана (68)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/957ae53a-d543-4940-b71a-f0142c614c8c)

### 5. Створіть INSERT/UPDATE/DELETE-правила обробки операцій редагування віртуальної таблиці.

На рисунку нижче видно, що операції INSERT/UPDATE/DELETE виконати не можна
![Снимок экрана (69)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/5958a90f-4682-47b7-a62b-12b7b6a76f5f)

Тому були створені наступні правила

INSERT

![Снимок экрана (70)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/e1df33ca-aab6-4837-a99b-c349ad0a6ec3)

UPDATE

![Снимок экрана (72)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/5c7b44c5-929d-4bfc-8349-e3d0904441e7)

DELETE

![Снимок экрана (72)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/4119b114-d7b6-4723-8221-fb83168f580f)

### 6. Перевірте роботу механізму вибіркового керування, виконавши операції INSERT, UPDATE, DELETE до віртуальної таблиці.

INSERT

![Снимок экрана (87)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/d9b4e618-8f51-49c6-83d2-6fed6ffce27e)

UPDATE

![Снимок экрана (89)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/27a5cddf-1515-4e47-a7b6-11a530408099)

DELETE

![Снимок экрана (89)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/3ae105f2-bd6e-41c4-a7fa-cf957883949e)

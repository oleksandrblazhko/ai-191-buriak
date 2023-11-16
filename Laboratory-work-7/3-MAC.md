## Кроки:

### 1. Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.
![Снимок экрана (75)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/e92eb817-b307-4fae-a13b-6fd3a817cea3)

![Снимок экрана (76)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/768a7a9d-c50f-4d89-8c2f-88844f51ead9)

### 2. Додайте до таблиці з даними стовпчик, який буде зберігати мітки конфіденційності. Визначте для кожного рядка таблиці мітки конфіденційності, які будуть різнитися (для кожного рядка своя мітка).
![Снимок экрана (76)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/82fc3431-3ecb-49f5-8d68-afbaf9bf1c34)

### 3. Визначте для користувача його рівень доступу.
![Снимок экрана (77)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/028773e3-f499-4f07-8215-77b74f930840)

### 4. Створіть нову схему даних, назва якої співпадає з назвою користувача.
![Снимок экрана (77)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/1739db8e-4379-4fc4-a81f-f50229a74e2c)

### 5. Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача.
![Снимок экрана (78)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/82ad63da-9e3e-4b56-9e48-ecb17b04c355)

### 6. Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

Знімаємо права доступу до реальної таблиці та встановлюємо права доступу на віртуальну таблицю:

![Снимок экрана (92)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/c71b35d2-d330-48e3-8427-dedb83c1d971)

Перевіримо вміст реальної та віртуальної таблиць:

![Снимок экрана (92)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/4b6235cc-16d3-4e5d-96a6-963f569539cd)

Змінимо у одного елемента мітку конфіденційності:

![Снимок экрана (93)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/e9b03e5e-2a0f-4171-b0c3-f5e518ff53df)


Було створено правила повноважного керування доступом для користувача buryak

![Снимок экрана (80)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/b1cc428e-a136-4810-a06d-1eb4f8089b24)

### 7. Встановіть з’єднання з СКБД від імені нового користувача.
![Снимок экрана (81)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/64a96c49-77ac-44c6-a161-c8ba7366f4c2)

### 8. Від імені нового користувача перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE

Для початку змінемо значення стовпця "spot_conf" на 2 для того щоб користувач buryak міг їх побачити.
![Снимок экрана (83)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/06ed3430-5d2d-472b-8688-ae4478835f2b)

![Снимок экрана (83)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/ff52bd05-6bc2-4ffc-b765-c8d8920a0297)

SELECT

![Снимок экрана (83)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/bf65470f-5571-4232-a290-adbb371815cc)

INSERT

Як бачимо, користувач baranov не бачить нового запису, адже мітка конфіденційності нового запису більша, ніж у користувача.

![Снимок экрана (87)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/1efe153e-934c-4352-8eb4-a546ed0df6e8)

![Снимок экрана (83)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/bf65470f-5571-4232-a290-adbb371815cc)

Якщо виконати запит на перегляд таблиці від коритсувача postgres то бачимо що новий запис було успішно внесено в таблицю.

![Снимок экрана (88)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/02f2d4f0-2fb8-4456-9d75-cb334a4b0705)

UPDATE

![Снимок экрана (89)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/2c30e64c-3b7b-4cb5-97fb-524b9abfc3a8)

DELETE

![Снимок экрана (89)](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/97d74e09-0240-41f5-b71a-e2becef19fce)

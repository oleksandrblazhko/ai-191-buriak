## Тестування WebSockets
| ID |
|:-:|
| WSTG-CLNT-10 |

### Короткий опис

Традиційно протокол HTTP дозволяє лише один запит/відповідь на TCP-з’єднання. Асинхронні JavaScript і XML (AJAX) дозволяють клієнтам асинхронно надсилати й отримувати дані (у фоновому режимі без оновлення сторінки) на сервер, однак AJAX вимагає від клієнта ініціювати запити та чекати відповідей сервера (напівдуплекс).

[WebSockets](https://websockets.spec.whatwg.org/#network) дозволяють клієнту або серверу створювати «повнодуплексний» (двосторонній) канал зв’язку, дозволяючи клієнту та серверу дійсно спілкуватися асинхронно. WebSockets здійснюють своє початкове рукостискання оновлення через HTTP, і відтоді весь зв’язок здійснюється через канали TCP за допомогою фреймів. Щоб дізнатися більше, перегляньте [протокол WebSocket](https://datatracker.ietf.org/doc/html/rfc6455).

### Джерело

Сервер відповідає за перевірку [`Початковий` заголовок](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin) в початковому рукостисканні HTTP WebSocket. Якщо сервер не перевіряє заголовок джерела під час початкового рукостискання WebSocket, сервер WebSocket може приймати підключення з будь-якого джерела. Це може дозволити зловмисникам обмінюватися даними з міждоменним сервером WebSocket, дозволяючи виникати проблеми, подібні до CSRF. Дивіться також [Top 10-2017 A5-Порушений контроль доступу](https://owasp.org/www-project-top-ten/2017/A5_2017-Broken_Access_Control).

### Конфіденційність і Цілісність

WebSockets можна використовувати через незашифрований TCP або через зашифрований TLS. Для використання незашифрованих WebSockets `ws://` використовується схема URI (за замовчуванням порт 80), для використання зашифрованих (TLS) WebSockets `wss://` використовується схема URI (за замовчуванням порт 443). Дивіться також [Top 10-2017 A3-Розкриття конфіденційних даних](https://owasp.org/www-project-top-ten/2017/A3_2017-Sensitive_Data_Exposure).

### Дезінфекція Входу

Як і будь-які дані, отримані з ненадійних джерел, дані мають бути належним чином оброблені та закодовані. Дивіться також [Top 10-2017 A1-Ін'єкція](https://owasp.org/www-project-top-ten/2017/A1_2017-Injection) і [Top 10-2017 A7-Міжсайтовий сценарій (XSS)](https://owasp.org/www-project-top-ten/2017/A7_2017-Cross-Site_Scripting_(XSS)).

### Цілі тестування

- Визначте використання WebSockets.
- Оцініть його реалізацію, використовуючи ті самі тести на звичайних каналах HTTP.

### Як протестувати
#### Тестування чорної скриньки

 1. Визначте, що програма використовує WebSockets.
     - Перегляньте вихідний код на стороні клієнта для схеми `ws://` або `wss://` URI.
     - Використовуйте Інструменти розробника Google Chrome, щоб переглянути зв’язок мережі WebSocket.
     - Використовуйте вкладку WebSocket [ZAP’s](https://www.zaproxy.org/).
 2.   Джерело.

      - За допомогою клієнта WebSocket (його можна знайти в розділі [Інструменти]() нижче) спробуйте підключитися до віддаленого сервера WebSocket. Якщо з’єднання встановлено, сервер може не перевіряти вихідний заголовок рукостискання WebSocket.
 3. Конфіденційність і Цілісність.

      - Переконайтеся, що підключення WebSocket використовує SSL для передачі конфіденційної інформації `wss://`.
      - Перевірте впровадження SSL на наявність проблем із безпекою (дійсний сертифікат, BEAST, CRIME, RC4 тощо). Див. розділ [Тестування на слабку безпеку транспортного рівня](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/01-Testing_for_Weak_Transport_Layer_Security) цього посібника.
 4. Аутентифікація.

      - WebSockets не обробляють автентифікацію, слід проводити звичайні тести автентифікації чорної скриньки. Зверніться до розділів [Тестування автентифікації](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/04-Authentication_Testing/README) цього посібника.
 5. Авторизація.

      - WebSockets не обробляють авторизацію, слід провести звичайні тести авторизації чорної скриньки. Зверніться до розділів [Тестування авторизації](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/05-Authorization_Testing/README) цього посібника.
 6. Дезінфекція входу.

      - Використовуйте вкладку WebSocket у [ZAP’s](https://www.zaproxy.org/), щоб відтворювати та змішувати запити та відповіді WebSocket. Зверніться до розділів [Тестування для перевірки даних](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/07-Input_Validation_Testing/README) цього посібника.
   
### Приклад 1
Коли ми визначили, що програма використовує WebSockets (як описано вище), ми можемо використовувати [OWASP Zed Проксі-сервер атаки (ZAP)](https://www.zaproxy.org/) для перехоплення запиту WebSocket і відповідей. Після цього ZAP можна використовувати для відтворення та розмитості запитів/відповідей WebSocket.
![OWASP_ZAP_WebSockets](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/04a236a9-88cf-44b9-922a-299c315ada16)

Малюнок 4.11.10-1: ZAP WebSockets

### Приклад 2
За допомогою клієнта WebSocket (його можна знайти в розділі [Інструменти]() нижче) спробуйте підключитися до віддаленого сервера WebSocket. Якщо підключення дозволено, сервер WebSocket може не перевіряти заголовок походження рукостискання WebSocket. Спробуйте відтворити раніше перехоплені запити, щоб перевірити, чи можливе міждоменне спілкування WebSocket.
![WebSocket_Client](https://github.com/oleksandrblazhko/ai-191-buriak/assets/145441728/8c278f4f-b1c6-4622-bc93-90a444ef14a9)

Малюнок 4.11.10-2: Клієнт WebSocket

### Тестування сірого ящика

Тестування сірого ящика схоже на тестування чорного ящика. У тестуванні сірого ящика тестувальник пера частково знає програму. Єдина відмінність тут полягає в тому, що ви можете мати документацію API для програми, що тестується, яка містить очікуваний запит WebSocket і відповіді.

### Інструменти

- [OWASP Zed Проксі-сервер атаки (ZAP)](https://www.zaproxy.org/)
- [Клієнт WebSocket](https://github.com/ethicalhack3r/scripts/blob/master/WebSockets.html)
- [Простий клієнт Google Chrome WebSocket](https://chrome.google.com/webstore/detail/simple-websocket-client/pfdhoblngboilpfeibdedpjgfnlcodoo?hl=en)

### Список літератури

- [HTML5 Rocks – Представляємо WebSockets: перенесення сокетів у Інтернет](https://web.dev/articles/websockets-basics?hl=ru)
- [W3C - The WebSocket API](https://websockets.spec.whatwg.org/#network)
- [IETF - Протокол WebSocket](https://datatracker.ietf.org/doc/html/rfc6455)
- [Крістіан Шнайдер - міжсайтове викрадення WebSocket (CSWSH)](https://christian-schneider.net/CrossSiteWebSocketHijacking.html)
- [Jussi-Pekka Erkkilä - Аналіз безпеки WebSocket (PDF)](https://juerkkil.iki.fi/files/writings/websocket2012.pdf)
- [Роберт Кох - Про WebSockets у тестуванні на проникнення](https://www.ub.tuwien.ac.at/dipl/2013/AC07815487.pdf)
- [DigiNinja - OWASP ZAP і Web Sockets](https://digi.ninja/blog/zap_web_sockets.php)

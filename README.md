# Учебная практика: Решение кейс-задач

![Java](https://img.shields.io/badge/Java-24%2B-blue)
![Delphi](https://img.shields.io/badge/Delphi-10.2%2B-blue)
![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-orange)
![MsSQL](https://img.shields.io/badge/MsSQL-20%2B-orange)
![IIS](https://img.shields.io/badge/IIS-10.0%2B-lightgrey)


Репозиторий содержит решения 5 кейс-задач, выполненных в рамках учебной практики университета Синергия. Решения реализованы на Java + Delphi с использованием современных подходов к разработке и баз данных с СУБД MySQL и MsSQL.

## 📌 Содержание
1. [Кейс-задачи](#-кейс-задачи)
2. [Требования](#-требования)

## � Кейс-задачи

### 1. Обработка одномерного массива
**Задача**: Дан одномерный массив А размерности N. Найти сумму отрицательных элементов, расположенных между максимальным и минимальным.

**Решение**:  
Для разработки программы данной кейс-задачи был использован ЯП `Java 24`.  
Были использованы стандартные алгоритмы обработки и поиска по массиву, а также применены базовые принципы `ООП` и паттерна проектирования `SOLID`.  
Логика и архитектура проекта была разделена на UI-слой (`Main.java`), Бизнес-логику (`TaskSolver.java`) и Модели данных (`TaskResult.java`).  
Были обработаны все возможные исключения и ввод данных.  
Алгоритм имеет оценку `O(n)` - количество итераций в проходах будет напрямую зависеть от размера массива.  
Пример выполнения:  
<img width="768" height="240" alt="image" src="https://github.com/user-attachments/assets/32c4650b-5a95-4a4c-ab21-d101722dba27" />

[Проект с исходным кодом](TaskCase1/src/synergy/educational/practice).  


### 2. Демонстрация наследования классов
**Задача**: Написать тестовую программу, которая демонстрирует работу методов базового и производного классов.

**Решение**:  
Для разработки программы и демонстрации примеров данной кейс-задачи был использован ЯП Java 24.  
Были применены базовые принципы ООП.  
Примеры наследования и изменения поведения в дочерних классах (полиморфизм) были реализованы при помощи следующей иерархии классов:  
|── Person.java   
| |── Father.java  
| | |── Son.java  

Класс `Person` - общий класс человека, который по умолчанию имеет такие свойства (характеристики) как: `имя`, `возраст`, `вес`, `цвет глаз` и `способности`.  
Также этот класс имеет поведение/действи такие как: `разговаривать`, `кушать`, `спать` и `показывать информацию о себе`. Эти действия (методы) по умолчанию имееют свою реализацию (например при разговоре объект этого класса выдаст фразу: `"I'm a person!"`).  

Класс `Father` - является классом-наследником от класса `Person`. Он имеет всё то же самое, что и его класс-родитель (благодаря модификаторам `public` и `protected` и механизму наследования). Для него установлены свои базовые значения характеристик.  
Но помимо всего этого базового, этот класс также обладает дополнительной характеристикой: `характер/личность` и дополнительным действием: `идти на рыбалку` (объект класса по этому методу выдаст фразу: `"I caught a lot of fish!"`).  
Также класс `Father` переопределяет/переписывает стандартное поведение методов класса `Person` (например тот же метод `разговаривать` объект этого класса уже выдаст фразу `I'm a father! Where is my son?`).  

Класс `Son` - является классом-наследником от класса `Father`. Он имеет всё то же самое, что и его класс-родитель (и предок класса-родителя, т.е. `Person`). Для него установлены свои базовые значения характеристик.  
Но помимо всего этого, этот класс также обладает дополнительными действиями/методами: `играть в игры` и `разрабатывать программы`.
Также класс `Son` переопределяет/переписывает стандартное поведение методов класса `Person` и класса `Father` (например тот же метод `разговаривать` объект этого класса уже выдаст фразу `I'm a son! Daddy, i'm here! I'm playing football`, а метод `идти на рыбалку` выдаст фразу: `"I hate fishing!"`).  
Пример выполнения:  
<img width="1010" height="870" alt="image" src="https://github.com/user-attachments/assets/7b0d017a-0586-49df-8c95-1700dd28bde6" />

[Проект с исходным кодом](TaskCase2/src/synergy/educational/practice).

### 3. Проектирование БД "Туризм"
**Задача**: Спроектируйте базу данных «Туризм» (перечень предоставляемых услуг, заказ туров и др.).  
При проектировании базы данных необходимо создать 4-5 таблиц предметной области: 3-4 таблицы-справочника и 1 таблицу переменной информации. Для всех таблиц создать первичные ключи. Построить связи между таблицами при помощи внешних ключей: атрибуты таблицы переменной информации должны ссылаться на ключевые атрибуты таблиц справочников.  
Когда вы создаете базу данных в MySQL с помощью MySQL Workbench (или любого другого инструмента), вы можете экспортировать схему базы данных в виде скрипта SQL. Этот скрипт SQL содержит определения таблиц, связей, индексов и других структур базы данных, которые вы создали. Или иным удобным для Вас способом.

**Решение**:
В ходе выполнения задания была спроектирована БД на тему `"Туризм"`.  
Для БД был выбран СУБД `MySql`.  
Была реализована следующая схема БД:
<img width="1215" height="894" alt="image" src="https://github.com/user-attachments/assets/04c2ce33-0680-4502-aa43-2528d660749a" />

1. `service_catalogue (Каталог услуг)`  
**Описание:** Хранит информацию о туристических услугах, предлагаемых агентством.  
**Свойства:**
- `service_catalogue_num_id` - Уникальный числовой идентификатор услуги (первичный ключ);
- `service_code` - Код услуги (уникальный);
- `service_name` - Название услуги (уникальное);
- `service_name_en` - Название услуги на английском (уникальное);
- `description` - Подробное описание услуги;
- `price` - Стоимость услуги (десятичное число с 2 знаками после запятой);
- `active_flag` - Флаг активности записи (1 - активна, 0 - неактивна).


2. `tour_client (Клиенты)`  
**Описание:** Содержит данные о клиентах туристического агентства.  
**Свойства:**
- `tour_client_num_id` - Уникальный числовой идентификатор клиента (первичный ключ);
- `first_name` - Имя клиента;
- `last_name` - Фамилия клиента`
- `patronymic` - Отчество клиента;
- `age` - Возраст клиента;
- `phone` - Телефон клиента (уникальный);
- `email` - Email клиента (уникальный);
- `passport_serial` - Серия паспорта;
- `passport_number` - Номер паспорта;
- `active_flag` - Флаг активности записи.


3. `tour_order (Заказы)`  
**Описание:** Содержит информацию о заказах клиентов.  
**Свойства:**
- `tour_order_id` - Уникальный идентификатор заказа (первичный ключ);
- `tour_client_num_id` - Ссылка на клиента (внешний ключ);
- `service_catalogue_num_id` - Ссылка на услугу (внешний ключ);
- `hotel_catalogue_num_id` - Ссылка на отель (внешний ключ);
- `order_date` - Дата оформления заказа;
- `start_date` - Дата начала тура;
- `end_date` - Дата окончания тура;
- `total_cost` - Общая стоимость заказа (десятичное число);
- `active_flag` - Флаг активности записи.


4. `hotel_catalogue (Каталог отелей)`  
**Описание:** Содержит информацию об отелях.  
**Свойства:**
- `hotel_catalogue_num_id` - Уникальный числовой идентификатор отеля (первичный ключ);
- `hotel_name` - Название отеля (уникальное);
- `hotel_name_en` - Название отеля на английском (уникальное);
- `description` - Описание отеля;
- `address` - Адрес отеля;
- `star_rating` - Количество звезд;
- `floor_count` - Количество этажей;
- `active_flag` - Флаг активности записи;
- `location_catalogue_num_id` - Ссылка на местоположение (внешний ключ).


5. `location_catalogue (Каталог местоположений)`  
**Описание:** Хранит географическую информацию о местах назначения.  
**Свойства:**
- `location_catalogue_num_id` - Уникальный числовой идентификатор местоположения (первичный ключ);
- `country` - Страна;
- `city` - Город;
- `latitude` - Географическая широта (десятичное число с 6 знаками после запятой);
- `longitude` - Географическая долгота (десятичное число с 6 знаками после запятой);
- `active_flag` - Флаг активности записи.


Данный набор таблиц с атрибутами позволит минимально обеспечить работу системы Туризма с возможностью хранения как справочных данных о услугах и т.д., так и переменной информации по заказом туров клиентов.  
[Схема БД + SQL-скрипты](TaskCase3).


### 4. Web-приложение на Delphi + IIS
**Задача**: Проведите анализ и опишите имеющихся на рынке программного обеспечения информационных систем, построенных по архитектуре WEB-приложений. Оцените и опишите возможности предлагаемых систем по архитектуре WEB-приложений и варианты их использования в компании.  
Создайте с помощью Delphi 10.2 и MS Internet Information Server (IIS) приложение WEB-архитектуры на любую тему. Базу данных для WEB-приложения создать в MS SQL Server.  
Ответом на задачу будет ссылка на репозиторий GitHub, где хранится Ваша программа. Или иным удобным для Вас способом.  
Когда вы создаете базу данных в MySQL с помощью MySQL Workbench (или любого другого инструмента), вы можете экспортировать схему базы данных в виде скрипта SQL. Этот скрипт SQL содержит определения таблиц, связей, индексов и других структур базы данных, которые вы создали. Или иным удобным для Вас способом.  

**Решение**:
Для разработки программы WEB-архитектуры данной задачи был использован ЯП Delphi 10.2.3, IIS и бд с СУБД MS SQL Server.
Тип проекта - `Web Server Application` с использованием `ISAPI`.  
Главным модулем с обработкой API-запросов и выводом данных и форм страницы в браузере является `BookActionsUnit.pas`. В нём происходит подключение к БД через компоненты `ADO` и обработка всей логики приложения (вывод и базовый `CRUD`):
- `WebModule1DefaultHandlerAction` - стандартный метод обработки входящих запросов (некий маршрутизатор действий);
- `WebModule1BooksListAction` - отображение страницы со всем списком книг;
- `WebModule1BookEditAction` - отображение формы с редактированием выбранной книги;
- `WebModule1BookSaveAction` - сохранение данных новой/отредактированной книги;
- `WebModule1BookDeleteAction` - удаление выбранной книги.

Пример страницы с отображением каталога книг:
<img width="1638" height="441" alt="image" src="https://github.com/user-attachments/assets/e217ae45-6014-4985-926e-3281d02fdb05" />

[Проект + анализ имеющихся систем](TaskCase4).

### 5. Аналитический обзор
**Задача**: Сформировать и описать аналитический обзор проделанной работы в одной из кейс-задач № 1-4 на Ваш выбор, по следующим критериям:  
- `Функциональность`: Это основной критерий, который оценивает, насколько хорошо программа выполняет свои задачи. Программа должна корректно обрабатывать все входные данные и выдавать правильные результаты;
- `Производительность`: Этот критерий оценивает скорость работы программы. Быстрая работа программы важна для приложений, где требуется обработка большого объема данных или высокая интерактивность;
- `Удобство использования (юзабилити)`: Критерий, который оценивает, насколько легко пользователь может взаимодействовать с программой. Удобный интерфейс и понятные сообщения об ошибках делают программу более привлекательной для пользователей;
- `Безопасность`: Важный критерий, особенно для программ, которые работают с конфиденциальными данными. Безопасная программа должна защищать данные от несанкционированного доступа и предотвращать возможные уязвимости;
- `Масштабируемость`: Критерий, который оценивает, насколько легко программу можно расширить или модифицировать для обработки большего объема данных или добавления новых функций;
- `Сопровождаемость`: Оценивает, насколько легко поддерживать и обновлять программу. Хорошо структурированный код, четкие комментарии и документация упрощают процесс сопровождения;
- `Переносимость`: Критерий, который оценивает, насколько легко программу можно перенести на другую платформу или систему без значительных изменений;
- `Качество кода`: Оценка качества кода включает такие аспекты, как читаемость, структурированность, использование стандартных практик и паттернов проектирования, отсутствие ошибок и т.д.;
- `Тестирование`: Критерий, который оценивает, насколько хорошо программа была протестирована. Полное тестирование помогает выявить ошибки и улучшить качество программы.

Это лишь примерный список параметров, которые могут быть использованы для описания задания. Конкретные параметры могут варьироваться в зависимости от программы.
На основе проведенного анализа выше предложите способы решения выявленных проблем в ходе выполнения выбранной Вами кейс-задачи.

**Решение**:
Для аналитического обзора проделанной работы в ходе учебной практики была выбрана и решена кейс-задача №1 на языке программирования Java:  
`"Дан одномерный массив A размерности N. Найти сумму отрицательных элементов, расположенных между максимальным и минимальным."`  
Программа была разработана с использованием объектно-ориентированного подхода и проанализирована по ключевым критериям качества программного обеспечения. Программное решение проекта разделено на логические модули:
- `Main` – UI слой;
- `TaskSolver` – Бизнес-логика;
- `TaskResult` – Модель данных результата.

**Критерии оценки**:
| Критерий        | Оценка | Комментарии |
|-----------------|--------|-------------|
| Функциональность | ★★★★☆  | Следует реализовать возможность ручного ввода массива значений в любом диапазоне |
| Производительность | ★★★★☆ | Индексы минимального и максимального значения находятся в двух разных функциях, а значит будет каждый раз по 2 прохода по массиву. Следует объединить поиск мин. и макс. сразу в одну функцию |
| Удобство использования (юзабилити) | ★★★★☆ | Следует добавить меню выбора (ручной ввод значений массива / генерация) и цикл перезапуска программы без завершения |
| Безопасность    | -  | Отсутствует критерий, т.к. нет работы с конфиденциальными данными |
| Масштабируемость | ★★★★☆ | Можно вынести параметры генерации в конфигурационный файл и добавить поддержку других типов |
| Сопровождаемость | ★★★☆☆ | Необходимо добавить описание методов и комментарии к коду к частям алгоритмов и задокументировать входные/выходные параметры |
| Переносимость | ★★★★★ |  |
| Качество кода | ★★★★☆ | Следует добавить описание методов и комментарии к коду к частям алгоритмов |
| Тестирование | ★★★☆☆ | Присутствует только ручное тестирование, необходимо написать unit-тесты |


**Общие рекомендации по улучшению**:
- Оптимизация алгоритмов;
- Добавление unit-тестов;
- Написание документации и добавление комментариев;

[Подробный аналитический обзор](TaskCase5).



## ⚙ Требования
- Java 24+
- MySQL 8.0+
- Delphi 10.2+
- IIS 10.0+

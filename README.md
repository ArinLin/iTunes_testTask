## iTunes_testTask
#### Разработать приложение, которое включает в себя:
###### 1. Экран регистрации пользователя с валидацией полей
- Имя (только на английском)
- фамилия (только на английском)
- Возраст (с возможностью выбора через календарь и не младше 18 лет)
- Номер телефона
- E-mail (проверка на корректность введенного email)
- Пароль (не менее 6 символов, обязательно должны быть цифра, буква нижнего регистра, буква верхнего регистра)
Все поля должны быть обязательны для заполнения и проверены на валидность.
###### 2. Экран авторизации пользователя
- Поля email и пароль;
- Проверка на наличие пользователя в «базе»;
- Переход на следующий экран только для авторизованного пользователя.
###### 3. Экран поиска музыкальных альбомов + Данные пользователя с экрана регистрации.
- search bar и табличное представление найденных альбомов;
- альбомы должны быть отсортированы по алфавиту;
- по нажатию на альбом открывается экран альбома.
- искать можно и на русском и на английском.
###### 4. Экран альбома.
- Обязательно для отображения:
• лого альбома
• название альбома
• название группы
• год выхода альбома
• список песен

###### Требования:
- Xcode 11+, Swift 5+, iOS 14+, не использовать SwiftUI;
- Можно использовать любые сторонние библиотеки;
- Дизайн должен соответствовать Human Interface Guidelines;
- Результат можно прислать ссылкой на гитхаб или в архиве;
- Проект должен устанавливаться без дополнительных действий, кроме установки зависимостей (pod install), и ошибок.
- Данные пользователя не должны передаваться между экранами, а должны сохранятся в локальную базу данных устройства и извлекаться из нее.
- Возможные ошибки должны быть обработаны.
[API](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html "API")

<img width="316" alt="AuthVC" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/5f97faf3-4d1a-44c5-9aad-4376b7189e90">
<img width="318" alt="AuthVCWrongPass" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/e385b32c-4024-449e-97b3-87f352bc8b84">
<img width="321" alt="RegistrationCheck" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/f1e53cb9-86bc-4bad-bf80-3525299c2eba">
<img width="316" alt="RegistrationSucces" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/5108343f-66b7-44ba-a54e-ea83d227daae">
<img width="320" alt="Playlist" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/1c43c7e7-9d73-4b82-8380-e492f79bf0fb">
<img width="321" alt="AboutAlbum" src="https://github.com/ArinLin/iTunes_testTask/assets/100975821/c07cf76a-5516-4013-96d5-883949ed3bdc">



# language: ru
  Функционал: определение что пользователь проголосовал за страницу
    Чтобы опеределить какой лейбл показывать пользователю
    Сервис
    Должен уметь определять что пользлватель уже голосовал за страницу
  
  Сценарий:
    Допустим имеется идентификатор ползователя "100001256148752" и адрес страницы "http://localhost:8000/"
    Если я спрошу, голосовал ли пользователь за эту страницу
    То вернется отрицательный ответ
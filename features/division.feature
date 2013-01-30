# language: ru
Функция: Деление чисел
  Поскольку деление сложный процесс и люди часто допускают ошибки
  Нужно дать им возможность делить на калькуляторе

  Структура сценария: Целочисленное деление
    Допустим я ввожу в калькулятор первое число <делимое>
    И затем ввожу в калькулятор второе число <делитель>
    Если я нажимаю "Делить"
    То результатом должно быть число <частное>

  Примеры:
    | делимое | делитель | частное |
    | 100     | 2        | 50      |
    | 28      | 7        | 4       |
    | 0       | 5        | 0       |
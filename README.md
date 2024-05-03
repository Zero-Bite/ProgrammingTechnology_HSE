# ProgrammingTechnology_HSE

Чтобы запустить данный скрипт (ТЗ1.sh) - необходимо скачать его на локальный копьютер. После чего перейти в директорию, куда был установлен файл и выполнить команду :

```./ТЗ1.sh```

После этого скрипт начнет свое выполенние и попросит пользователя последовательно ввести\n
                  'входная директория' : "Enter input director";
                  'выходная директория' : "Enter output directory";

В скрипт установлен ряд проверок. Во-первых, что переменные заполнены значениями, если нет - скрипт прекратит свое выполнение.
Во-вторых, проверка на первый параметр - он должен сущестовать (путь указан верно и указанный каталог возможно обнаружить), в противном случае скрипт завершит свое выполнение. В-третьих, если второй параметр не ведет к конкретному каталогу (его не существует по указанному адресу), то он будет создан.

Также в ходе работы программы будет создан файл logs.txt. В него будут записаны все ссылки на файлы из директории, указанной в первом параметре. Также на экране будут выведены все файлы, которые были скопированы. 

Проблема одинаковых имен решена путем смены имени у таких файлов в домашней директории и присвоением им числового имени из диапазона от 1 до 10_000_000_000 с сохранением расширения файла. Выбор конкретного числового значения основывается на проверке, что данного файла нет в 'выходная директория'. Данный подход покрывает все пользовательские сценарии и работает корректно.

После окончания программы на экран будет выведено: "Программа закончила свое выполнение"

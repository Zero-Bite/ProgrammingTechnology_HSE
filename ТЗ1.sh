#!/bin/bash 

# Ввод входной директории
printf "Enter input directory\n";
read home_directory

# Проверка на ввод значения 1
if [[ -z $home_directory ]]; then
	echo "!Не введен параметр input directory!
		   <--Скрипт принудительно завершит работу-->"
	exit
fi

Проверка на существования каталога по этому адресу
if ! [ -d $home_directory ]; then
	echo "! Не существует указанной директории !
		    Проверьте корректность указанных данных"
	exit
fi

#home_directory="МЕСТО ДЛЯ ТЕСТОВ С ДИРЕКТОРИЕЙ"

# Ввод выходной директории
printf "Enter output directory\n";
read output_directory

# Проверка на ввод значения 2
if [[ -z $output_directory ]]; then
	echo "			!Не введен параметр output directory
				<--Скрипт принудительно завершит работу-->"
	exit
fi

#output_directory="МЕСТО ДЛЯ ТЕСТОВ С ДИРЕКТОРИЕЙ"

# Проверка существования выходной директории, если ее нет => создать
if ! [ -d $output_directory ]; then
	mkdir $output_directory
fi

# echo $home_directory
# echo $output_directory


# Запишем пути до всех файлов в текстовый файл (резервное-копирование); 
# Cюда же можно прочесть содержимое файлов
touch logs.txt
# ls
for file in `find $home_directory -type f -name "*"`
do
   echo -E ${file};
done > logs.txt



#Чтение каталогов и подкатологов
echo
echo "Список файлов:"
for file in `find $home_directory -type f -name "*"`
do
   	echo --- $file

	rezshir=${file##*.} # Получаем расширение файла

	name=$(basename $file) # получаем имя файла

   	# Проверка, что файл с таким именем не встречался раньше
	if [ ! -f $output_directory/$name ]; 
	then
		echo "first 1"
		cp $file $output_directory;
	else
		echo "second 2"
		for ((COUNTER=1;COUNTER<10000000000;COUNTER++)) # большое число; данный подход будет решать проблему одинаковых имен файлов.
		do
			# echo "POP"
			# echo $COUNTER
			# echo $output_directory/$COUNTER.$rezshir

			if [ ! -f $output_directory/$COUNTER.$rezshir ]; 
			then
				echo "Look"
				mv $home_directory/$name $home_directory/$COUNTER.$rezshir
				cp $home_directory/$COUNTER.$rezshir $output_directory
				break
			fi
		done

	fi

   
done 
echo "Конец списка файлов"

echo
echo

echo "Программа закончила свое выполнение"


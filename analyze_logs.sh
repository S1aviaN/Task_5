
#!/bin/bash

#1 Подсчет общего количества запросов
total_requests=$(wc -l < access.log)

#2 Подсчет количества уникальных IP-адресов с использованием awk
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)

#3 Подсчет количества запросов по методам с использованием awk
methods=$(awk '{print $6}' access.log | sort | uniq -c | awk '{print $2, $1}')

#4 Поиск самого популярного URL с использованием awk
popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

#5 Создание отчета
echo "Отчет о логе веб-сервера" > report.txt
echo "=========================" >> report.txt
echo "Общее количество запросов: $total_requests" >> report.txt
echo "Количество уникальных IP-адресов: $unique_ips" >> report.txt
echo "Количество запросов по методам:" >> report.txt
echo "$methods" >> report.txt
echo "Самый популярный URL: $popular_url" >> report.txt

echo "Отчет сохранен в файл report.txt"

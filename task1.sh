#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="website_status.log"

echo "Перевірка доступності сайтів, дата: $(date)" > "$log_file"


# Обхід кожного сайту зі списку

for site in "${websites[@]}"; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")
    if [ "$status_code" -eq 200 ]; then
        echo "<$site> is UP" >> "$log_file"
    else
        echo "<$site> is DOWN" >> "$log_file"
    fi
done

# Вивід повідомлення про успішне записування логів
echo "Результати записано у файл: $log_file"
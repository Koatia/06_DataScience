#!/bin/bash

#sudo apt install ghostscript
find . -type f -name "*.pdf" | while read file; do
  # Создаем временный файл
  temp_file="${file%.pdf}_temp.pdf"

  # Обработка файла через Ghostscript и сохранение в временный файл
  gs -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.4 \
    -dDownsampleColorImages=true \
    -dColorImageResolution=150 \
    -dNOPAUSE \
    -dBATCH \
    -sOutputFile="$temp_file" "$file"

  # Если обработка успешна, заменяем оригинальный файл
  if [ $? -eq 0 ]; then
    mv "$temp_file" "$file"
  else
    echo "Ошибка при обработке файла $file"
    rm "$temp_file"
  fi
done

# find . -type f -name "*.pdf" — команда find рекурсивно ищет все файлы (-type f) с расширением .pdf, начиная с текущей директории (.)
# Для того, чтобы заменить в имени файла webm на mp4, необходимо получить имя файла без расширения. Вот примеры:
# $file / ${file} — получение значения переменной file, то есть имя и расширение: video1.webm
# ${file%.webm} — имя файла без расширения webm: video1
#
# Возьмём имя файла без расширения и добавим в конец .mp4
# ${file%.webm}.mp4 — имя файла и расширение mp4: video1.mp4

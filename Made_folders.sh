#!/bin/bash

while IFS= read -r line; do
    if [ ! -d "$line" ]; then
        mkdir -p "$line"
        #mkdir -p "${line}/ClassWork"
        #mkdir -p "${line}/HomeWork"
        #echo 'print("\033[H\033[J")  # Очистка консоли' > "${line}/ClassWork/main.py"
        #echo 'print("\033[H\033[J")  # Очистка консоли' > "${line}/HomeWork/main.py"
        echo "## $line" > "${line}/README.md"
        #echo "public class Program {" > "${line}/Program.java"
        #echo "    public static void main(String[] args) throws Exception {" >> "${line}/Program.java"
        #echo "        // Ваш код здесь" >> "${line}/Program.java"
        #echo "    }" >> "${line}/Program.java"
        #echo "}" >> "${line}/Program.java"
        # Переходим в созданный каталог и выполняем dotnet new console
        #(cd "${line}/ClassWork" && dotnet new console)
        #(cd "${line}/HomeWork" && dotnet new console)
    fi
done < "Made_folders.txt"

echo "Для завершения нажмите Enter"
read -r message

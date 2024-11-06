#!/bin/bash

# Обновление списка пакетов и установленных пакетов
echo "Обновляем список пакетов и установленные пакеты..."
sudo apt update && sudo apt upgrade -y

# Установка полезных и часто используемых утилит
echo "Устанавливаем полезные утилиты..."

# htop - интерактивный просмотр процессов
sudo apt install -y htop

# curl - инструмент для передачи данных
sudo apt install -y curl

# tmux - терминальный мультиплексор
sudo apt install -y tmux

# build-essential - набор инструментов для компиляции
sudo apt install -y build-essential

# net-tools - сетевые утилиты (включая ifconfig)
sudo apt install -y net-tools

# Neofetch - утилита для отображения информации о системе
sudo apt install -y neofetch

# Установка веб-сервера Nginx
echo "Устанавливаем веб-сервер Nginx..."
sudo apt install -y nginx

# Установка базы данных PostgreSQL
echo "Устанавливаем базу данных PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib

# Установка Docker и Docker Compose
echo "Устанавливаем Docker и Docker Compose..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo apt install -y docker-compose

# Обновление информации о версии системы
VERSION_FILE="/etc/lsb-release"

echo "Обновляем информацию о версии системы в $VERSION_FILE"

# Создаем резервную копию оригинального файла
sudo cp "$VERSION_FILE" "$VERSION_FILE.bak"

# Заменяем содержимое файла на новую информацию
sudo bash -c "cat <<EOL > $VERSION_FILE
DISTRIB_ID=ComfortableOS
DISTRIB_RELEASE=2024.03
DISTRIB_CODENAME=comfortable
DISTRIB_DESCRIPTION=\"ComfortableOS Server 2024.03 LTS\"
EOL"

echo "Информация о версии успешно обновлена!"

# Завершаем установку
echo "Установка завершена! Перезапускаем оболочку..."
exec $SHELL
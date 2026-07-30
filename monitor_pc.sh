#!/bin/bash

BOT_TOKEN="8929572598:AAFWesmsyzTZrFGYLtB1PmK0ou8NU46yh9E"
CHAT_ID="8267281287"
PHONE_TARGET="10.19.11.1:5556"

echo "[+] Старт мониторинга Xiaomi 15 с виртуальной машины..."

# Отправляем стартовое уведомление из Ubuntu
curl -s -X POST "https://telegram.org{BOT_TOKEN}/sendMessage" \
     -d "chat_id=${CHAT_ID}" \
     -d "text=🚀 Мониторинг запущен! Ubuntu успешно контролирует ваш Xiaomi 15." > /dev/null

while true; do
    # Проверяем, в сети ли устройство через ваш автомат adb
    if adb devices | grep -q "$PHONE_TARGET.*device"; then
        # Читаем емкость батареи удаленно в один клик
        BATTERY=$(adb -s $PHONE_TARGET shell cat /sys/class/power_supply/battery/capacity 2>/dev/null | tr -d '\r\n')
        
        if [ -z "$BATTERY" ]; then
            BATTERY="ошибка чтения"
        else
            BATTERY="${BATTERY}%"
        fi
        
        MSG="📊 Статус Xiaomi 15 (Удаленно)%0A🔋 Батарея: ${BATTERY}%0A⏰ Время: $(date +%H:%M:%S)"
    else
        MSG="⚠️ Внимание: Связь с Xiaomi 15 ($PHONE_TARGET) потеряна!"
    fi

    # Отправляем сформированный лог напрямую из Ubuntu в Telegram
    curl -s -X POST "https://telegram.org{BOT_TOKEN}/sendMessage" \
         -d "chat_id=${CHAT_ID}" \
         -d "text=${MSG}" > /dev/null
         
    echo "[+] Лог отправлен в $(date +%H:%M:%S). Следующая проверка через 10 минут."
    sleep 600
done

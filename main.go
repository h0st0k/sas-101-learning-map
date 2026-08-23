package main

import (
	"os"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"
	"time"
)

var BotToken = os.Getenv("TELEGRAM_BOT_TOKEN")
const chatID = "8267281287"

func sendTelegram(message string) {
		apiURL := "https://api.telegram.org/bot" + BotToken + "/sendMessage"
	resp, err := http.PostForm(apiURL, url.Values{
		"chat_id": {chatID},
		"text":    {message},
	})
	if err != nil {
		fmt.Println("[-] Ошибка отправки в Telegram:", err)
		return
	}
	defer resp.Body.Close()
	fmt.Println("[+] Сообщение ушло в Telegram!")
}

func getBatteryLevel() string {
	data, err := ioutil.ReadFile("/sys/class/power_supply/battery/capacity")
	if err != nil {
		return "неизвестно"
	}
	return strings.TrimSpace(string(data)) + "%"
}

func main() {
	fmt.Println("[+] Скрипт запущен. Отправляем тестовое сообщение...")
	sendTelegram("🚀 Привет с Xiaomi 15! Опечатка в URL исправлена, бот работает отлично.")

	for {
		battery := getBatteryLevel()
		msg := fmt.Sprintf("📊 Статус Xiaomi 15\n🔋 Батарея: %s\n⏰ Время: %s", 
			battery, time.Now().Format("15:04:05"))
		
		sendTelegram(msg)
		time.Sleep(10 * time.Minute)
	}
}

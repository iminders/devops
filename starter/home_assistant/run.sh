docker run -d --name="home-assistant" -v /你的/config/路径:/config -e "TZ=Asia/Shanghai" -p 8123:8123 homeassistant/home-assistant

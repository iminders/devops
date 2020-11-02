click_host?=iminders
click_port?=7899

up:
	docker-compose up -d

stop:
	docker stop clickhouse

down:
	docker-compse down

client:
	docker run -it --rm  yandex/clickhouse-client --host $(click_host) --port $(click_port)

tabix:
	docker run -d -p 7900:80 tabix

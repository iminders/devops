click_host?=iminders
click_port?=7899

up:
	docker-compose up -d

stop:
	docker stop clickhouse

down:
	docker-compose down

client:
	docker run -it --rm  yandex/clickhouse-client --host $(click_host) --port $(click_port) --user devops --password ***

tabix:
	docker run -d -p 7900:80 -v /etc/hosts:/etc/hosts:ro -e CH_HOST=$(click_host):$(click_port) spoonest/clickhouse-tabix-web-client

clean:
	rm -rf $(DATA_HOME)/clickhouse

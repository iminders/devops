# https://hub.docker.com/r/preset/superset/
SUPERSET_PASSWD?=test2020

up:
	docker run -d -p 8080:8080 --name superset preset/superset:0.37
	make config

config:
	docker exec -it superset superset fab create-admin \
               --username liuwen \
               --firstname liu \
               --lastname wen \
               --email liuwen.w@qq.com \
               --password $(SUPERSET_PASSWD)
	docker exec -it superset superset db upgrade
	docker exec -it superset superset init
	make drivers

down:
	docker stop superset
	docker rm superset


stop:
	docker stop superset


drivers:
	docker exec -it --user root superset pip install mysqlclient
	docker exec -it --user root superset pip install clickhouse-driver sqlalchemy-clickhouse

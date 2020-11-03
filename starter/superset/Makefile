# https://hub.docker.com/r/preset/superset/
up:
	docker run -d -p 8080:8080 --name superset preset/superset

config:
	docker exec -it superset superset fab create-admin \
               --username liuwen \
               --firstname liu \
               --lastname wen \
               --email liuwen.w@qq.com \
               --password $(SUPERSET_PASSWD)
	docker exec -it superset superset db upgrade
	docker exec -it superset superset load_examples
	docker exec -it superset superset init

down:
	docker down superset


stop:
	docker stop superset

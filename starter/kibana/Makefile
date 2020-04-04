.PHONY: init clean run

clean:
	rm -rf /tmp/data/kibana
	rm -rf /tmp/data/elasticsearch
	rm -rf /tmp/filebeat/logs

up:
	# sudo sysctl -w vm.max_map_count=262144
	docker-compose up -d elasticsearch logstash kibana

pull:
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:elasticsearch.latest
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:logstash.latest
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:kibana.latest

down:
	docker-compose down

.PHONY: init clean run

init:
	mkdir -p /tmp/data/kibana
	mkdir -p /tmp/data/elasticsearch
	mkdir -p /tmp/filebeat/logs

clean:
	rm -rf /tmp/data/kibana
	rm -rf /tmp/data/elasticsearch
	rm -rf /tmp/filebeat/logs

run:
	# sudo sysctl -w vm.max_map_count=262144
	docker-compose up -d elasticsearch logstash kibana

pull:
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:elasticsearch.latest
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:logstash.latest
	docker pull registry.cn-hangzhou.aliyuncs.com/tradingai/elk:kibana.latest

down:
	docker-compose down

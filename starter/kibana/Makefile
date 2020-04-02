.PHONY: init clean run

init:
	mkdir -p /home/ubuntu/data/kibana
	mkdir -p /home/ubuntu/data/elasticsearch

clean:
	rm -rf /home/ubuntu/data/kibana
	rm -rf /home/ubuntu/data/elasticsearch

run:
	# sudo sysctl -w vm.max_map_count=262144
	docker-compose up -d

stop:
	docker-compose down

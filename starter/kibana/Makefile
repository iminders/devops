.PHONY: init clean run

init:
	mkdir -p /home/ubuntu/data/kibana
	mkdir -p /home/ubuntu/data/elasticsearch

clean:
	rm -rf /home/ubuntu/data/kibana
	rm -rf /home/ubuntu/data/elasticsearch

run:
	docker-compose up -d

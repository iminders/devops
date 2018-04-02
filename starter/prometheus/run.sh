docker run -d -p 9090:9090 -v /tmp/prometheus.yml:/home/ubuntu/data/prometheus/prometheus.yml \
       prom/prometheus

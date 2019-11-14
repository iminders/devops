docker run -d -p 9090:9090 -v /home/ubuntu/data/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
      --restart always \
      -v /etc/hosts:/etc/hosts \
       prom/prometheus

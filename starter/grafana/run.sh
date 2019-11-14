docker run \
  -d \
  -p 3000:3000 \
  --name grafana \
  --restart always \
  -e "GF_SERVER_ROOT_URL=http://grafana.godel.com" \
  --volume "/home/ubuntu/data/grafana/data:/var/lib/grafana" \
  --volume "/etc/hosts:/etc/hosts" \
  grafana/grafana

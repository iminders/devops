docker run \
  -d \
  -p 3000:3000 \
  --name=grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=$SECRET" \
  grafana/grafana

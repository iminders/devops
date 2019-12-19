# https://github.com/NVIDIA/gpu-monitoring-tools/blob/master/exporters/prometheus-dcgm/README.md
docker run -d \
--restart always \
--runtime=nvidia --name=nvidia-dcgm-exporter -v /run/prometheus:/run/prometheus nvidia/dcgm-exporter

docker run -d \
--restart always \
--net="host" --pid="host" \
--volumes-from nvidia-dcgm-exporter:ro quay.io/prometheus/node-exporter --collector.textfile.directory="/run/prometheus"

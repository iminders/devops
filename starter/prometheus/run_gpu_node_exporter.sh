# https://github.com/NVIDIA/gpu-monitoring-tools/blob/master/exporters/prometheus-dcgm/README.md
# 安装container runtime: https://www.linuxidc.com/Linux/2019-07/159613.htm
docker run -d \
  --restart always \
  -p 9445:9100 \
  --runtime=nvidia --rm --name=nvidia-dcgm-exporter nvidia/dcgm-exporter

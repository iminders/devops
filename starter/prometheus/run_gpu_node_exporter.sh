# https://github.com/mindprince/nvidia_gpu_prometheus_exporter
docker run -d \
  --restart always \
  -e LD_LIBRARY_PATH=$LD_LIBRARY_PATH \
  --device-cgroup-rule 'c 195:* mrw' \
  -p 9445:9445 \
  mindprince/nvidia_gpu_prometheus_exporter:0.1

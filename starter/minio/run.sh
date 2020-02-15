docker run -d -p 9000:9000 \
  -e MINIO_ACCESS_KEY=$MINIO_ACCESS_KEY \
  -e MINIO_SECRET_KEY=$MINIO_SECRET_KEY \
  -v /home/ubuntu/data/minio:/data minio/minio server /data

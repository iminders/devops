docker run -d --network=host --name storage -e TRACKER_SERVER=ip:22122 -v /home/ubuntu/data/fastdfs/storage:/var/fdfs delron/fastdfs storage

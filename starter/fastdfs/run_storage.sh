docker run -d --network=host --name storage -e TRACKER_SERVER=192.168.1.105:22122 -v /home/ubuntu/data/fastdfs/storage:/var/fdfs delron/fastdfs storage

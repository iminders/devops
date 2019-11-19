docker run -d -v /home/ubuntu/data/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry:latest

# step 1. ubuntu
sudo apt-get update
sudo apt-get install python-pip
sudo pip install shadowsocks
sudo ssserver -p 8388 -k password -m aes-256-cfb -d start

# step 2. security group config for 8388

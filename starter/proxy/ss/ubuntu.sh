# ubuntu 18.04

# step 1. ubuntu
sudo apt-get update

sudo apt install python2.7

sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1

sudo apt-get install python-pip

sudo pip install shadowsocks
sudo ssserver -p 8443 -k password -m aes-256-cfb -d start

# 查看用户

# step 2. security group config for 8388

# stop:
sudo ssserver -d stop


# python3
sudo apt install python3-pip
sudo pip3 install shadowsocks

sudo nano /etc/shadowsocks/config.json
{
    "server":"::",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"password",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}

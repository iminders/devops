mkdir -p nginx_data/{conf,conf.d,html,log}
mkdir -p nginx_data/conf/vhost
cp nginx.conf nginx_data/conf/
cp vhost/* nginx_data/conf/vhost/

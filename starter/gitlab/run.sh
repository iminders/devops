sudo docker run --detach \
    --hostname gitlab.godel.com \
    --publish 443:443 --publish 8080:80 --publish 10022:22 \
    --name gitlab_1 \
    --restart always \
    --volume /home/ubuntu/data/gitlab/config:/etc/gitlab \
    --volume /home/ubuntu/data/gitlab/logs:/var/log/gitlab \
    --volume /home/ubuntu/data/gitlab/data:/var/opt/gitlab \
    registry.cn-hangzhou.aliyuncs.com/devops/gitlab-ce:9.2.6-ce.0

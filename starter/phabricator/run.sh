docker-compose up -d


# docker run -d --name mariadb -e ALLOW_EMPTY_PASSWORD=yes -e MARIADB_EXTRA_FLAGS=--local-infile=0 \
#   --net phabricator-tier \
#   --volume mariadbdata:/bitnami \
#   bitnami/mariadb:latest
#
# docker run -d --name phabricator -p 5081:80 -p 5443:443 \
#   --net phabricator-tier \
#   --volume phabricator_data:/bitnami \
#   bitnami/phabricator:latest

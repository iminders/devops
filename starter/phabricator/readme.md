# How to migrate from a Bitnami Phabricator Stack

You can follow these steps in order to migrate it to this container:

1. Export the data from your SOURCE installation: (assuming an installation in `/bitnami` directory)

  ```bash
  $ cd /bitnami/phabricator/apps/phabricator/htdocs/bin
  $ ./storage dump | gzip > ~/backup-phabricator-mysql-dumps.sql.gz
  $ cd /bitnami/phabricator/apps/phabricator/data/
  $ tar -zcvf ~/backup-phabricator-localstorage.tar.gz .
  $ cd /bitnami/phabricator/apps/phabricator/repo/
  $ tar -zcvf ~/backup-phabricator-repos.tar.gz .
  ```

2. Copy the backup files to your TARGET installation:

  ```bash
  $ scp ~/backup-phabricator-* YOUR_USERNAME@TARGET_HOST:~
  ```

3. Create the Phabricator Container as described in the section #How to use this Image (Using Docker Compose)

4. Wait for the initial setup to finish. You can follow it with

  ```bash
  $ docker-compose logs -f phabricator
  ```

  and press `Ctrl-C` when you see this:

  ```
  nami    INFO  phabricator successfully initialized
  Starting application ...

    *** Welcome to the phabricator image ***
    *** Brought to you by Bitnami ***
  ```

5. Stop Phabricator daemon:

  ```bash
  $ docker-compose exec phabricator nami stop phabricator
  ```

  set mariadb password
  ```
  docker-compose exec mariadb mysql -uroot -p

  grant all on *.* to root@'localhost' identified by 'ROOT_PASSWORD';
  flush privileges;
  ```

6. Restore and upgrade the database: (replace ROOT_PASSWORD below with your MariaDB root password)

  这里需要查看一下mysql dump的表名是否正常

  ```bash
  $ cd ~
  $ docker-compose exec phabricator /opt/bitnami/phabricator/bin/storage destroy --force
  $ gunzip -c ./backup-phabricator-mysql-dumps.sql.gz | docker-compose exec -T  mariadb mysql -uroot -pROOT_PASSWORD
  $ docker-compose exec phabricator /opt/bitnami/phabricator/bin/storage upgrade --force
  ```

7. Restore repositories from backup:

  ```bash
  $ cat ./backup-phabricator-repos.tar.gz | docker-compose exec phabricator bash -c 'cd /bitnami/phabricator/repo ; tar -xzvf -'
  ```

8. Restore local storage files:

  ```bash
  $ cat ./backup-phabricator-localstorage.tar.gz | docker-compose exec -T phabricator bash -c 'cd /opt/bitnami/phabricator/data ; tar -xzvf -'
  ```

9. Fix repositories storage location: (replace ROOT_PASSWORD below with your MariaDB root password)

  ```bash
  $ cat | docker-compose exec mariadb mysql -pROOT_PASSWORD <<EOF
USE bitnami_phabricator_repository;
UPDATE repository SET localPath = REPLACE(localPath, '/bitnami/apps/phabricator/repo/', '/opt/bitnami/phabricator/repo/');
COMMIT;
EOF
  ```

10. Fix Phabricator directory permissions:

  ```bash
  $ docker-compose exec phabricator chown -R phabricator:phabricator /bitnami/phabricator
  ```

11. Restart Phabricator container:

  ```bash
  $ docker-compose restart phabricator
  ```

mysqldump -u username -p'passwd' dbname | ssh user@host mysql -u username -h192.168.1.104 -p'passwd' -P3309 dbname

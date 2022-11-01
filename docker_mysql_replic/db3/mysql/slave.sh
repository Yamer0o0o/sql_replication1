#!/bin/bash
# sleep 90
# gunzip < /etc/cert/mysql/dump.gz | mysql -u root -p123 

# mysql -u root -p123 -e GRANT REPLICATION SLAVE ON *.* TO 'ssl_test'@'%';
# mysql -u root -p123 < zcat /etc/cert/mysql/dump.gz
# #docker exec -it replication-master mysqldump -u root -p@H9p3v6c --all-databases --master-data |gzip > /etc/mysql/dump.sql.gz 
# mysqldump -u root -p123  --all-databases --source-data  | gzip > /etc/cert/mysql/dump.gz
#mysqld  database_name < file.sql



mysql -u root -p123 -e "CHANGE MASTER TO MASTER_HOST='replication-master', MASTER_USER='ssl_test' , MASTER_PASSWORD = '123', MASTER_SSL=1, MASTER_SSL_CA='/etc/cert/mysql/ca-cert.pem', MASTER_SSL_CERT='/etc/cert/mysql/client-cert.pem', MASTER_SSL_KEY='/etc/cert/mysql/client-key.pem';"

mysql -u root -p123 < /etc/cert/mysql/dump.sql 

mysql -u root -p123 -e "START SLAVE";

# MASTER_LOG_FILE='mysql-bin.000004' ,   MASTER_LOG_POS=345 , 
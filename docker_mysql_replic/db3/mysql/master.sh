#!/bin/bash
# sleep 60
 mysql -u root -p123 -e "CREATE USER 'ssl_test'@'%' IDENTIFIED BY '123' REQUIRE SSL;"
 mysql -u root -p123 -e " GRANT REPLICATION SLAVE ON *.* TO 'ssl_test'@'%'; "

#docker exec -it replication-master mysqldump -u root -p@H9p3v6c --all-databases --master-data |gzip > /etc/mysql/dump.sql.gz 


#mysqldump -u root -p123  --all-databases --source-data=1  | gzip > /etc/cert/mysql/dump.gz
 mysqldump -u root -p123  -A -R -E --triggers --single-transaction --source-data=1  > /etc/cert/mysql/dump.sql


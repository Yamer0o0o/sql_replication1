#!/bin/bash
docker exec -it replication-master mysql -u root -p@ -e CREATE USER 'ssl_test'@'%' IDENTIFIED BY '123' REQUIRE SSL;
docker exec -it replication-master mysql -u root -p@ -e GRANT REPLICATION SLAVE ON *.* TO 'ssl_test'@'%';
docker exec -it replication-master mysqldump -u root -p123 --all-databases --master-data |gzip > /etc/mysql/dump.sql.gz 

docker exec -it replication-master ' /bin/bash | mysqldump -u root -p@H9p3v6c  --all-databases --source-data  | gzip > /etc/cert/mysql/123' 

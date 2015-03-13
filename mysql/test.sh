#! /bin/bash
docker rm mysql-test
docker create -v /var/lib/mysql --name mysql-test dynamind/data-only nop
docker run -it --volumes-from mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=changeit --rm mysql /bin/bash
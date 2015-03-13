#! /bin/bash
docker stop mysql
docker rm mysql
docker run --volumes-from mysql-data -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=changeit --name mysql mysql
docker logs -f mysql

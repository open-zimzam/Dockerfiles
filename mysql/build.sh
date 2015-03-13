#! /bin/bash
docker rm mysql
docker rm mysql-data
docker create -v /var/lib/mysql --name mysql-data dynamind/data-only nop
docker build -t mysql .
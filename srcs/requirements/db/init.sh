#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

service mariadb start
while ! mysqladmin ping -h localhost --silent; do
    sleep 0.1
done

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

service mariadb stop
while mysqladmin ping -h localhost --silent; do
    sleep 0.1
done


mariadbd

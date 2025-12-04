#!/bin/bash
service mariadb start

SQL_PASSWORD=$(cat /run/secrets/sql_password)
sleep 2

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
service mariadb stop

exec mysqld_safe --port=3306 --bind-address=0.0.0.0


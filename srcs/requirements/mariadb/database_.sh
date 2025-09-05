#!/bin/bash
service mariadb start
sleep 1
mysql -u root -p="${PASSWORD_ROOT}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -p="${PASSWORD_ROOT}" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p="${PASSWORD_ROOT}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
mysql -u root -p="${PASSWORD_ROOT}" -e "FLUSH PRIVILEGES;"
service mariadb stop
mysqld

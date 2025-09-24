#!/bin/bash
service mariadb start

SQL_PASSWORD=$(cat /run/secrets/sql_password)
PASSWORD_ROOT=$(cat /run/secrets/sql_root_password)
sleep 1
echo "WordPress DB password is $SQL_PASSWORD $PASSWORD_ROOT"
mysql -u root -p="${PASSWORD_ROOT}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -p="${PASSWORD_ROOT}" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p="${PASSWORD_ROOT}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
mysql -u root -p="${PASSWORD_ROOT}" -e "FLUSH PRIVILEGES;"
service mariadb stop
mysqld

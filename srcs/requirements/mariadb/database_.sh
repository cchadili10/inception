#! /bin/bash

set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "initializing database ..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql & sleep 5

mariadb -u root <<-EOSQL 
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
    CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}';
    CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

killall mysqld_safe
exec mysqld_safe --datadir=/var/lib/mysql
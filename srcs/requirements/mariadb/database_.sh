#!/bin/bash
set -e

DATADIR="/var/lib/mysql"

# Initialize MariaDB data dir if missing
if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir="$DATADIR"

    # Start temp server
    mysqld_safe --datadir="$DATADIR" &
    pid=$!
    sleep 5

    # Run setup SQL
    mysql -u root <<-EOSQL
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL

    # Shutdown temp server
    mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
    wait $pid
fi

# ✅ Start MariaDB in foreground (keeps container alive)
exec mysqld_safe --datadir="$DATADIR"




# set -e

# mysqld --datadir=/var/lib/mysql &
# pid="$!"
# sleep 5

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
# mysql -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
# sleep 2
# exec mysqld --datadir=/var/lib/mysql
# "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"

# if [ ! -d "/var/lib/mysql/mysql" ]; then
#     echo "initializing database ..."
#     mariadb-install-db --user=mysql --datadir=/var/lib/mysql
# fi

# mysqld_safe --datadir=/var/lib/mysql & sleep 5

# mariadb -u root <<-EOSQL 
#     ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
#     CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}';
#     CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
#     GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
#     FLUSH PRIVILEGES;
# EOSQL


# service mysql start;
# killall mysqld_safe
#!/bin/bash
# set -e

# # Wait for MariaDB to be ready
# echo "Waiting for MariaDB..."
# until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
#   sleep 2
# done
# echo "MariaDB is up!"

# # Generate wp-config.php if it doesn’t exist
# if [ ! -f wp-config.php ]; then
#   wp config create \
#     --dbname=$WORDPRESS_DB_NAME \
#     --dbuser=$WORDPRESS_DB_USER \
#     --dbpass=$WORDPRESS_DB_PASSWORD \
#     --dbhost=$WORDPRESS_DB_HOST \
#     --allow-root
# fi

# # Install WordPress if not installed
# if ! wp core is-installed --allow-root; then
#   wp core install \
#     --url=$URL \
#     --title=$TITLE \
#     --admin_user=$ADMINUSER \
#     --admin_password=$ADMINPASSWORD \
#     --admin_email=$EMAILADMINE \
#     --skip-email \
#     --allow-root
# fi

# exec php-fpm8.2 -F

# mkdir -p /run/php
# sleep 10
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp
# wp core download --allow-root
# sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf
# wp config create --dbname=${NAME_DATABASE} --dbuser=${NAME_USER} --dbpass=${USER_PASSWORD} --dbhost=${DB_HOST} --allow-root
  # wp config create \
  #   --dbname=$WORDPRESS_DB_NAME \
  #   --dbuser=$WORDPRESS_DB_USER \
  #   --dbpass=$WORDPRESS_DB_PASSWORD \
  #   --dbhost=$WORDPRESS_DB_HOST \
  #   --allow-root --path='/var/www/html'

# wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMINUSER} --admin_password=${ADMINPASSWORD} --admin_email=${EMAILADMINE} --allow-root
# wp user create ${USERNAME} ${EMAILUSR} --role=${ROLE} --user_pass=${USERPASSWORD} --allow-root 
exec php-fpm8.2 -F
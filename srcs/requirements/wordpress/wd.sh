#!/bin/bash
sleep 5
service redis-server start
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root
wp config set WP_REDIS_HOST $URL --type=constant --allow-root 
wp config set WP_REDIS_PORT  6379 --type=constant --allow-root 
wp config set WP_REDIS_DATABASE 0 --type=constant --allow-root 
wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMINUSER} --admin_password=${ADMINPASSWORD} --admin_email=${EMAILADMINE} --allow-root
wp user create ${USERS} ${EMAILUSER} --role=${ROLE} --user_pass=${PASSWORD} --allow-root 
wp plugin install redis-cache --activate --allow-root
exec php-fpm8.2 -F
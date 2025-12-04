#!/bin/bash
sleep 7

cd /var/www/html
WORDPRESS_DB_PASSWORD=$(cat /run/secrets/w_sql_password)
ADMINPASSWORD=$(cat /run/secrets/adminPass)
PASSWORD=$(cat /run/secrets/userPass)

if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -f wp-config.php ]; then
    echo "Installing WordPress..."
    wp core download --allow-root
    wp config create \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST \
        --allow-root
    wp config set WP_REDIS_HOST redis --type=constant --allow-root 
    wp config set WP_REDIS_PORT  6379 --type=constant --allow-root 
    wp config set WP_REDIS_DATABASE 0 --type=constant --allow-root 
    wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMINUSER} --admin_password=${ADMINPASSWORD} --admin_email=${EMAILADMINE} --allow-root
    wp user create ${USERS} ${EMAILUSER} --role=${ROLE} --user_pass=${PASSWORD} --allow-root 
    wp plugin install redis-cache --activate --allow-root
    sleep 2
    wp redis enable --allow-root
    wp option update permalink_structure '/%postname%/' --allow-root
    echo "WordPress installation complete!"
else
    echo "WordPress already installed, skipping setup..."
fi

exec php-fpm8.2 -F
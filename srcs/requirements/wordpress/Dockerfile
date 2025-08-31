FROM debian:12

RUN apt update && apt install -y wget
RUN apt install -y php8.2 php-fpm php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN	chown -R root:root /var/www/wordpress

COPY wp-config.php /var/www/html/

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
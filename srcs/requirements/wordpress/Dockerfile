
FROM debian:12

RUN apt update && apt install -y wget php8.2 php-fpm php-mysql mariadb-client curl
RUN chown -R www-data:www-data /var/www/html
RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 9000#' /etc/php/8.2/fpm/pool.d/www.conf
EXPOSE 9000
COPY tools/wd.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wd.sh
CMD ["wd.sh"]
# FROM debian:12

# RUN apt update && apt install -y wget
# RUN apt install -y php8.2 php-fpm php-mysql mariadb-client
# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html \
#     && tar -xzf /var/www/html/wordpress-6.0-fr_FR.tar.gz -C /var/www/html --strip-components=1 \
#     && rm /var/www/html/wordpress-6.0-fr_FR.tar.gz
# RUN	chown -R www-data:www-data /var/www/html
# RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = wordpress:9000#' /etc/php/8.2/fpm/pool.d/www.conf 
# RUN sed -i 's/;clear_env = no/clear_env = no/' /etc/php/8.2/fpm/pool.d/www.conf

# COPY wp-config.php /var/www/html/

# EXPOSE 9000

# CMD ["php-fpm8.2", "-F"]

# # COPY wd.sh /usr/local/bin/
# # RUN chmod +x /usr/local/bin/wd.sh
# # ENTRYPOINT ["/usr/local/bin/wd.sh"]
# # CMD ["tail", "-f", "/dev/null"]
FROM debian:12

RUN apt update && apt install -y wget php8.2 php-fpm php-mysql mariadb-client curl

# WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz -P /tmp \
    && tar -xzf /tmp/latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm /tmp/latest.tar.gz
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp \
#     && wp core download --allow-root 

RUN chown -R www-data:www-data /var/www/html

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 9000#' /etc/php/8.2/fpm/pool.d/www.conf
RUN sed -i 's/;clear_env = no/clear_env = no/' /etc/php/8.2/fpm/pool.d/www.conf


EXPOSE 9000
COPY wp-config.php /var/www/html/
RUN  chown www-data:www-data /var/www/html/wp-config.php && chmod 644 /var/www/html/wp-config.php
COPY wd.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wd.sh
CMD ["/usr/local/bin/wd.sh"]


# CMD ["php-fpm8.2", "-F"]
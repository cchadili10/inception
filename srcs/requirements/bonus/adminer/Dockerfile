FROM debian:12


RUN apt update && apt install -y php php-mysql wget unzip 
RUN mkdir -p /var/www/html \
    && wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php

EXPOSE 8080

ENTRYPOINT [ "php", "-S","0.0.0.0:8080", "-t", "/var/www/html" ]
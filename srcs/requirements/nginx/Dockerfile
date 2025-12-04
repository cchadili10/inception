FROM debian:12


RUN apt update && apt install -y nginx openssl
COPY  conf/nginx.conf /etc/nginx/nginx.conf

COPY  tools/spt.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/spt.sh

EXPOSE 443

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["spt.sh"]
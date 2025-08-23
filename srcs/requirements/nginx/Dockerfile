FROM debian:12

RUN apt update && apt apt install -y nginx openssl 
COPY  nginx.conf /etc/nginx/nginx.conf
COPY inception.crt /etc/nginx/ssl/inception.crt
COPY inception.key /etc/nginx/ssl/inception.key
EXPOSE 443

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g" "daemon off;" ]
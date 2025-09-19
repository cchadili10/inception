FROM debian:12


RUN apt update && apt install -y nginx
COPY  nginx.conf /etc/nginx/nginx.conf

COPY Portfolio/build/ /var/www/html

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html


EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
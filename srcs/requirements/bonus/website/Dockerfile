FROM debian:12


WORKDIR /var/www/html

RUN apt update && apt install -y nginx
COPY  conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/ .
EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
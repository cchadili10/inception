FROM debian:12

RUN apt update && apt apt install nginx openssl 
COPY  nginx.conf /etc/nginx/nginx.conf
COPY inception.crt /etc/nginx/ssl/inception.crt
COPY inception.key /etc/nginx/ssl/inception.key
EXPOSE 443

CMD [ "nginx", "-g" "daemon off;" ]
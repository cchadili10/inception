#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=KHO/L=khouribga/O=42/OU=42/CN=hchadili.42.fr/UID=hchadili"


exec nginx -g "daemon off;" 
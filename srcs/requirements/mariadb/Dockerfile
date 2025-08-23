FROM debian:12

RUN apt update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

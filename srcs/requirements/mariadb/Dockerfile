FROM debian:12

RUN apt update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
COPY database_.sh /usr/local/bin/
RUN chmod +x /user/local/bin/database_.sh
ENTRYPOINT ["database_.sh"]

CMD ["mysqld"]


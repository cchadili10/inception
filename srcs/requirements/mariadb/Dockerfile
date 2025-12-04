FROM debian:12

RUN apt update && apt install -y mariadb-server 
COPY tools/database_.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/database_.sh

ENTRYPOINT ["database_.sh"]

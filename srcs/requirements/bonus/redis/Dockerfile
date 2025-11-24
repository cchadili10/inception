FROM debian:12


RUN apt update && apt install -y redis-server 


COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
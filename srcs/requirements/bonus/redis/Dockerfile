FROM debian:12


RUN apt update && apt install -y redis-server 

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
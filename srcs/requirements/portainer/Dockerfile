FROM debian:12

RUN apt update && apt install -y curl ca-certificates tar \
    && rm -rf /var/lib/apt/lists/*

#
RUN curl -L https://github.com/portainer/portainer/releases/download/2.20.3/portainer-2.20.3-linux-amd64.tar.gz \
    -o /tmp/portainer.tar.gz \
    && tar -xzf /tmp/portainer.tar.gz -C /usr/local/bin --strip-components=1 \
    && rm /tmp/portainer.tar.gz

EXPOSE 9000

CMD ["portainer"]
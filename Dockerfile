FROM quay.io/clrxbl/docker-java-oracle:java8

MAINTAINER Michael H. <michael@eth0.co>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

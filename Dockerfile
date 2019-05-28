FROM adoptopenjdk/openjdk8-openj9:jdk8u212-b03_openj9-0.14.0-alpine-slim

MAINTAINER Michael H. <michael@eth0.co>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

FROM node:4.2-slim

MAINTAINER Brad Murray <wyaeld@gmail.com> <brad.murray@datacom.co.nz>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV GOSU_VERSION 1.7
ENV STATSD_VERSION 0.7.2

RUN curl -L https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu

RUN npm install -g --no-optional statsd@v$STATSD_VERSION

COPY    statsd-config.js /

EXPOSE  8125/udp
EXPOSE  8126/tcp

COPY ./run.sh /run.sh

CMD ["/run.sh"]

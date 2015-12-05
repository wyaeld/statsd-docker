FROM node:4.2-slim

MAINTAINER Brad Murray <wyaeld@gmail.com> <brad.murray@datacom.co.nz>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV GOSU_VERSION 1.7
ENV STATSD_VERSION v0.7.2
ENV APP_USER statsd
ENV APP_GROUP statsd

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r $APP_GROUP && useradd -ms /bin/bash -g $APP_USER $APP_GROUP

RUN curl -L https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu

RUN npm install -g --no-optional statsd@$STATSD_VERSION

COPY    statsd-config.js /

EXPOSE  8125/udp
EXPOSE  8126/tcp

COPY ./run.sh /run.sh

CMD ["/run.sh"]

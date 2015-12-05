FROM node:4.2-slim

MAINTAINER Brad Murray <wyaeld@gmail.com> <brad.murray@datacom.co.nz>

ENV STATSD_VERSION v0.7.2

RUN npm install -g statsd@$STATSD_VERSION

COPY    statsd-config.js /

EXPOSE  8125/udp
EXPOSE  8126/tcp

CMD     statsd /statsd-config.js

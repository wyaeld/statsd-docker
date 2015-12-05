#!/bin/sh -e

chown -R statsd:statsd /statsd-config.js

exec gosu statsd statsd /statsd-config.js

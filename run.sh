#!/bin/bash

chown -R nobody:nogroup /statsd-config.js

gosu nobody statsd /statsd-config.js

# Docker statsd

inspired by [antonlindstrom/docker-statsd](https://github.com/antonlindstrom/docker-statsd)

Updated to maximise efficiency

This is a simple example of running statsd in docker.

Statsd listens on 8125 by default, to use it outside you'll need to expose it
to the outside world.

Example to run the docker instance:

    sudo docker run -e GRAPHITE_HOST=graphite.example.com -p 8125:8125 -d wyaeld/statsd

Environment variables that can be used to set options:

    GRAPHITE_PORT (default: 2003)
    GRAPHITE_HOST (default: localhost)
    STATSD_PORT   (default: 8125)

This image is available in the docker registry at wyaeld/statsd:

    sudo docker pull wyaeld/statsd

The [statsd admin interface](https://github.com/etsy/statsd/blob/master/docs/admin_interface.md)
can be accessed through `8126/tcp`.

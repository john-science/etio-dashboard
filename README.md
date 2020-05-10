Introduction
============

This is a fork of [rq-dashboard](https://github.com/Parallels/rq-dashboard), with bespoke changes to customize the dashboard for a pet project at [Etiometry](https://www.etiometry.com/).

**NOTE** - If you are not a member of the Etiometry team, you will almost certainly get better mileage out of using the [original version of rq-dashboard](https://github.com/Parallels/rq-dashboard).

## Usage

In order to bind this Docker container to your Redis DB, you will have to open up the Redis port on your machine (default is 6379), and in your redis.conf (`/etc/redis/redis.conf` on Linux), you will have to set `bind 0.0.0.0`.

Now you can build the Docker image with your custom Redis Host and Port:

    docker build -t --build_arg REDIS_HOST=123.456.789.012 --build_arg PORT=6379 "dashboard:Dockerfile" .

And run it as per usual:

    docker run -p 9181:9181 CONTAINER123

Note that this 9181 is the port of your RQ Dashboard web app, and is configurable via docker build `--build_arg`.

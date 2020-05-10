# Introduction


This is a fork of [rq-dashboard](https://github.com/Parallels/rq-dashboard), with bespoke changes to customize the dashboard for a pet project at [Etiometry](https://www.etiometry.com/).

**NOTE** - If you are not a member of the Etiometry team, you will almost certainly get better mileage out of using the [original version of rq-dashboard](https://github.com/Parallels/rq-dashboard).


## Run via Commandline

On most POSIX systems, installing is as easy as:

    pip install -r requirements.txt
    make install

And running is as easy as:

    rq-dashboard -p 6379


## Docker Usage

> Recommended

This project also comes with a Dockerfile if you want to run it via Docker.

First, in order to bind this Docker container to your Redis DB, you will have to open up the Redis port on its host machine (default is 6379). And in your redis.conf (`/etc/redis/redis.conf` on Linux) you will have to set `bind 0.0.0.0` (and `protected_mode no` on newer versions of Redis).

Then you can build the Docker image with your custom Redis host and port:

    docker build --build-arg REDIS_HOST=123.456.789.012 --build-arg REDIS_PORT=6379 -t "dashboard:Dockerfile" .

And run it as per usual:

    docker run -p 9181:9181 CONTAINER123

Note that this 9181 is the port of your RQ Dashboard web app, and is configurable via docker build `--build_arg`.

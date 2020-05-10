FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		gcc \
		libc-dev \
	&& rm -rf /var/lib/apt/lists/*

ADD . /
RUN pip3 install -r requirements.txt
RUN python3 setup.py install

ARG DASH_PORT=9181
EXPOSE $DASH_PORT

ARG REDIS_HOST=localhost
ARG REDIS_PORT=6379
ENV RHOST=$REDIS_HOST
ENV RPORT=$REDIS_PORT

ENTRYPOINT python3 -m rq_dashboard --redis-url=redis://${RHOST}:${RPORT}


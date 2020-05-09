FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		gcc \
		libc-dev \
	&& rm -rf /var/lib/apt/lists/*

ADD . /
RUN pip3 install -r requirements.txt
RUN python3 setup.py develop

EXPOSE 9181

ENTRYPOINT ["python3", "-m", "rq_dashboard", "--redis-url=redis://localhost:6380"]


FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	wget \
	unixodbc \
	libmyodbc \
	mysql-client \	
	postgresql-client \
	sqlite3 \
	&& rm -rf /var/lib/apt/lists/* 
	
RUN wget -O dbmate https://github.com/amacneil/dbmate/releases/download/v1.6.0/dbmate-linux-amd64

RUN chmod +x dbmate

RUN cp dbmate /usr/local/bin/dbmate

RUN dbmate

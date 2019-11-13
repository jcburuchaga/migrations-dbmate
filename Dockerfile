FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	wget \
	postgresql-client \
	sqlite3 \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://dev.mysql.com/get/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.10-linux-ubuntu16.04-x86-64bit.tar.gz

RUN tar -xvf mysql-connector-odbc-5.3.10-linux-ubuntu16.04-x86-64bit.tar.gz

RUN cp mysql-connector-odbc-5.3.10-linux-ubuntu16.04-x86-64bit/lib/libmyodbc5* /usr/lib/x86_64-linux-gnu/odbc/

RUN mysql-connector-odbc-5.3.10-linux-ubuntu16.04-x86-64bit/bin/myodbc-installer -d -a -n "MySQL" -t "DRIVER=/usr/lib/x86_64-linux-gnu/odbc/libmyodbc5w.so;"

RUN wget -O dbmate https://github.com/amacneil/dbmate/releases/download/v1.6.0/dbmate-linux-amd64

RUN chmod +x dbmate

RUN cp dbmate /usr/local/bin/dbmate

RUN dbmate

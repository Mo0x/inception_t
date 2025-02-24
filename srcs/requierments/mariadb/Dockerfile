FROM debian:buster

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY setup.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]
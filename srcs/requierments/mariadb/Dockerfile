FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY setup.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]
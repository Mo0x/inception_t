#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mysqld --user=mysql --bootstrap < /docker-entrypoint-initdb.d/setup.sql
fi

exec mysqld --user=mysql
#!/bin/bash

QUERY="CREATE DATABASE IF NOT EXISTS radius;\
GRANT ALL PRIVILEGES ON radius.* TO 'radius'@'%' IDENTIFIED BY \"radpass\";\
use radius;\
source /etc/freeradius/sql/mysql/schema.sql;"

sed -i 's/server = "localhost"/server = "'${RPI_MYSQL_PORT_3306_TCP_ADDR}'"/g' sql.conf

echo ${QUERY} | mysql -u root -p${RPI_MYSQL_ENV_MYSQL_ROOT_PASSWORD} -h ${RPI_MYSQL_PORT_3306_TCP_ADDR}

freeradius -f

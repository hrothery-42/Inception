#!/bin/bash

mysqld_safe 

#creates a mysql script called db.sql

mysql

CREATE DATABASE IF NOT EXISTS $DB_NAME ;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;
GRANT ALL ON *.* TO '$DB_USER'@'%' ;
FLUSH PRIVILEGES;
exit

#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db.sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'%' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >>db.sql

mv db.sql /

mysqld_safe --init-file="/db.sql"


#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

#mysqld --user=mysql --init-file=/tmp/init.sql
/usr/bin/mysqld --user=mysql --bootstrap < /tmp/init.sql

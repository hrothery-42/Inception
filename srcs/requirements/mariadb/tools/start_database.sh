#!/bin/bash


service mysql start 

#creates a mysql script called db.sql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql

#alters root password
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PWD' ;" >> db1.sql

#refreshes the db table with the new data
echo "FLUSH PRIVILEGES;" >> db.sql

#executes the SQL script in the MySql server
mysql < db.sql

#stops the MySql server
kill $(cat /var/run/mysqld/mysqld.pid)

#starts the server again
/etc/init.d/mysql start
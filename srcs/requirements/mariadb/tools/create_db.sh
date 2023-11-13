#!bin/bash

#heredoc: <<EOF indicates the beginning of a block of text
#that will be fed to the cat command
#the contents up until the next EOF will be redirected to the file name
cat << EOF > /tmp/create_db.sql

USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED by '${DB_PWD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PWD}';
FLUSH PRIVILEGES;
EOF
		# bootstrap executes the commands then the tmp file is deleted
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
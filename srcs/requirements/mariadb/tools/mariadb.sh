#!/bin/sh

mysql_install_db

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

#set root option so that connection requires root pwd

mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

#add a root user to allow remote connection
#launch mysql from client
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -uroot

#create db and user in the db for wp
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD'; \
GRANT ALL ON *.* TO 'DB_USER'@'%'; \
FLUSH PRIVILEGES;" | mysql -uroot

#import db
mysql -uroot -p$DB_PWD $DB_NAME < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"
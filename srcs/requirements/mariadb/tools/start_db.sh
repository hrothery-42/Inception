#!/bin/sh
#!/bin/sh

cat << EOF > /init.sql

CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"
FLUSH PRIVILEGES;"

mysqld --user=mysql --bootstrap < /tmp/init.sql
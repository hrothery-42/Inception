#!/bin/bash

if [ ! -d "/var/www/html" ]; then
	mkdir -p /var/www/html
fi

cd /var/www/html

#install wp-cli and rename to wp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

download and install wordpress
wp core download --allow-root --locale=en_US

#rename the sample config file as default config
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

chmod +x wp-config.php
#change the important data in the config file
sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PWD/1"    wp-config.php
sed -i -r "s/localhost/$DB_HOST/1"    wp-config.php

#install wordpress
wp core install  --url="${WP_URL}" \
	--title="${WP_TITLE}" \
	--admin_user="${WP_ADMIN_LOGIN}" \
	--admin_password="${WP_ADMIN_PASSWORD}" \
	--admin_email="${WP_ADMIN_EMAIL}" \
	--skip-email --allow-root

wp user create ${WP_USER_LOGIN} ${WP_USER_EMAIL} \
	--user_pass=${WP_USER_PASSWORD} \
	--allow-root --role=author 

#listen on all ports so wordpress can connect outside its container
sed -i 's/listen = \/run\/php\/php-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
#sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
#    /etc/php7/php-fpm.d/www.conf

#run in foreground
php-fpm7.4 -F

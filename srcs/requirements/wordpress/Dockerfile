FROM debian:bullseye

RUN apt-get update && apt-get install -y curl \
	php php-fpm php-mysqli mariadb-client

EXPOSE 9000

RUN mkdir -p /var/www/html && \
sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

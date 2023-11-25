FROM debian:bullseye

RUN apt-get update && apt-get install -y curl \
	php php-fpm php-mysqli

EXPOSE 9000

COPY ./tools/www.conf /etc/php7.3/fpm/pool.d/

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

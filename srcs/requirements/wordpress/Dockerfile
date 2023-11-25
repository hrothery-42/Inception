FROM debian:bullseye

RUN apt-get update && apt-get install -y curl \
	php7.4 php7.4-fpm php7.4-mysqli

EXPOSE 9000

COPY ./tools/www.conf /etc/php7.4/fpm/pool.d/

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

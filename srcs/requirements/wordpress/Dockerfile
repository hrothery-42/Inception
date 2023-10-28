FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y curl php7.3 php-fpm php-mysql

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

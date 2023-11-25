FROM alpine:3.17

RUN apk update && \
    apk add curl php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-json php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring mariadb-client

EXPOSE 9000

RUN mkdir -p /var/www/html && \
	sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php7/php-fpm.d/www.conf

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

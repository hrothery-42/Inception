FROM alpine:3.17

RUN apk update && \
    apk add curl php php-fpm php-mysqli 

EXPOSE 9000

RUN mkdir -p /var/www/html && \
	sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php/7.4/cli/php.ini

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

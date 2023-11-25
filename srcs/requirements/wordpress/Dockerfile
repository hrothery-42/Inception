FROM alpine:3.17
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/main" > /etc/apk/repositories

RUN apk update && \
    apk add --no-cache curl php8 php8-fpm php8-mysqli 

EXPOSE 9000

RUN mkdir -p /var/www/html && \
	sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php8/php-fpm/conf
COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

FROM alpine:3.17

RUN apk update && \
    apk add --no-cache curl php php-fpm php-mysqli 

EXPOSE 9000

COPY ./tools/wp_start.sh /

RUN chmod +x /wp_start

CMD ["/wp_start.sh"]

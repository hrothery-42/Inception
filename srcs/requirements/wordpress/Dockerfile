FROM alpine:3.17-stable

ARG WP_URL WP_TITLE WP_NAME \
	WP_ADMIN_LOGIN WP_ADMIN_PASSWORD \
	WP_ADMIN_EMAIL WP_USER_LOGIN \
	WP_USER_PASSWORD WP_USER_EMAIL

EXPOSE 9000

RUN apk update && apk add -y curl php7.3 php-fpm php-mysql

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

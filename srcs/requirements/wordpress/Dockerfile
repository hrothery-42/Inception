FROM debian:bullseye

ARG WP_URL WP_TITLE WP_NAME \
	WP_ADMIN_LOGIN WP_ADMIN_PASSWORD \
	WP_ADMIN_EMAIL WP_USER_LOGIN \
	WP_USER_PASSWORD WP_USER_EMAIL

EXPOSE 9000

RUN apt-get update && apt-get install -y curl \
	php8.2 php8.2-fpm php8.2-mysqli

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

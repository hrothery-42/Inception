FROM debian:bullseye

ARG WP_URL WP_TITLE WP_NAME \
	WP_ADMIN_LOGIN WP_ADMIN_PASSWORD \
	WP_ADMIN_EMAIL WP_USER_LOGIN \
	WP_USER_PASSWORD WP_USER_EMAIL

EXPOSE 9000

RUN apt-get install software-properties-common ca-certificates lsb-release apt-transport-https
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' 
RUN wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add - 

RUN apt-get update && apt-get install -y curl \
	php8 php8-fpm php8-mysqli

COPY ./tools/wp_start.sh /

CMD ["/wp_start.sh"]

FROM debian:bullseye

RUN apt update -y && \
    apt install php-fpm php-mysql -y && \
	apt install curl -y

EXPOSE 9000

COPY ./tools/wp_start.sh /

RUN chmod +x /wp_start.sh

CMD ["/wp_start.sh"]

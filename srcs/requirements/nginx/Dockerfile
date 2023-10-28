FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx \
			openssl

COPY ./tools/start_nginx.sh /

RUN mkdir /etc/nginx/ssl

CMD [ "/start_nginx.sh"]

EXPOSE 443

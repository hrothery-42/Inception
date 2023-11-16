FROM debian:oldstable

RUN apt-get update

RUN apt-get install -y nginx \
			wget \
			curl \
			libnss3-tools

COPY ./tools/start_nginx.sh /

RUN mkdir /etc/nginx/ssl

CMD [ "/start_nginx.sh"]

EXPOSE 443

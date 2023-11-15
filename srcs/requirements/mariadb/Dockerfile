FROM alpine:3.17-stable

ARG DB_HOST DB_NAME DB_USER DB_PWD ROOT_PWD

RUN apk update

RUN apk add -y mariadb-server 

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start_database.sh /

EXPOSE 3306

CMD ["/start_database.sh"]
FROM debian:buster

RUN apt-get update

RUN apt-get install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start_database.sh /

EXPOSE 3306

CMD ["/start_database.sh"]

FROM debian:Bullseye

ARG DB_HOST DB_NAME DB_USER DB_PWD ROOT_PWD

RUN apt-get update

RUN apt-get install -y mariadb-server 

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start_database.sh /

EXPOSE 3306

CMD ["/start_database.sh"]
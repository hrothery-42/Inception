FROM debian:bullseye

ARG DB_HOST DB_NAME DB_USER DB_PWD ROOT_PWD

RUN apt-get update

RUN apt-get install -y mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
 && chown -R mysql:mysql /var/run/mysql \
 && chmod 777 /var/run/mysqld

#COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

#COPY ./tools/start_database.sh /
COPY ./tools/mariadb.sh /usr/local/bin/

EXPOSE 3306

CMD ["/start_database.sh"]
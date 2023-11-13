FROM alpine:3.16

#args will be deleted after runtime while
# env will stay in the environment forever (not desired)
ARG DB_HOST DB_NAME DB_USER DB_PWD ROOT_PWD

RUN apk update && apk add --no-cache mariadb mariadb-client

#skip-networking listens only for local Unix socket connections
#we need to disable it to listen to local machine and other containers
# bind-address 0 binds to all available network interfaces, making
#it accessible from outside the container
RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306


COPY requirements/mariadb/conf/create_db.sh .
RUN bash create_db.sh && rm create_db.sh
USER mysql
COPY tools/db.sh .
ENTRYPOINT  ["sh", "db.sh"]
CMD ["/usr/bin/mysqld", "--skip-log-error"]


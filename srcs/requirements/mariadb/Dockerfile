FROM alpine:3.17

RUN apk update && \ 
    apk add mariadb mariadb-client  && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

COPY ./tools/start_db.sh /start_db.sh

RUN chmod +x /start_db.sh

WORKDIR /

EXPOSE 3306

CMD ["./start_db.sh"]
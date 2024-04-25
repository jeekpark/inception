FROM debian:11

RUN apt-get update -y
RUN apt-get install mariadb-server -y
RUN apt-get install dumb-init -y
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "/init.sh"]

EXPOSE 3306

FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install mariadb-server -y
RUN apt-get install dumb-init -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./init.sh /
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "/init.sh"]

EXPOSE 3306

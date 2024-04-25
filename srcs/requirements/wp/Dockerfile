FROM debian:11

RUN apt-get update -y
RUN apt-get install dumb-init -y
RUN apt-get install php7.4-fpm php7.4-mysql -y
RUN apt-get install mariadb-client -y
RUN apt-get install curl -y




COPY ./init.sh /
RUN chmod 777 /init.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/dumb-init", "/init.sh"]

EXPOSE 9000

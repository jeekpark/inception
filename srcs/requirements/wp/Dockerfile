FROM debian:11

RUN apt-get update -y
RUN apt-get install dumb-init -y
RUN apt-get install php7.4-fpm php7.4-mysql -y
RUN apt-get install mariadb-client -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install unzip -y

WORKDIR /var/www/html
RUN wget https://wordpress.org/wordpress-6.5.2.zip
RUN unzip wordpress-6.5.2.zip
RUN mv wordpress/* ./
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN rm -rf wordpress-6.5.2.zip 
RUN rm -rf wordpress

RUN chown -R www-data:www-data /var/www/html
COPY ./init.sh /
RUN chmod 777 /init.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "/init.sh"]

EXPOSE 9000

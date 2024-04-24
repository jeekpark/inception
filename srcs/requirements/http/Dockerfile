FROM debian:11

RUN apt-get update -y
RUN apt-get install nginx openssl -y
RUN apt-get install dumb-init -y

COPY ./init.sh /

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "/init.sh"]

EXPOSE 443

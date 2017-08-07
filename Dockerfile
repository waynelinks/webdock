FROM alpine:latest

COPY application/ /application/

RUN chmod -R 777 /application/var/

VOLUME /application/

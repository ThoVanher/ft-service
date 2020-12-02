FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add influxdb 

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/entrypoint.sh /entrypoint.sh

EXPOSE 8086

CMD [ "/bin/sh", "/entrypoint.sh" ]

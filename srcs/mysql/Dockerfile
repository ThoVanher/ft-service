FROM alpine

RUN apk update 
RUN apk upgrade

#installation de mariadB pour la création d'une base de données de notre site wordpress
RUN apk add mariadb mariadb-client openrc

#installation de telegraf afin de fournir à influxdb les données d'utilisation des ressources par le container
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

#copie du script de lancement du container
COPY srcs/start_container.sh /start_container.sh

EXPOSE 3306

CMD [ "/bin/ash", "/start_container.sh" ]

FROM alpine

RUN apk update
RUN apk upgrade

#installation de nginx avec son fichier de configuration
RUN apk add nginx
RUN mkdir -p /run/nginx
COPY srcs/nginx.conf /etc/nginx/conf.d
RUN rm /etc/nginx/conf.d/default.conf
RUN apk add openrc

#installation des paquets php
RUN apk add curl
RUN apk add php-cgi php-fpm php-mbstring php-zip php-gd php-json php-mysqli php-session

#installation de wordpress avec son fichier de configuration
RUN curl 'https://wordpress.org/wordpress-5.5.1.tar.gz' > wordpress.tar.gz
RUN tar xf wordpress.tar.gz
RUN rm -rf /var/www
RUN mv wordpress /var/www
COPY srcs/wp-config.php /var/www/wp-config.php

#installation de telegraf afin de fournir à influxdb les données d'utilisations des ressources par le container
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf                                                      
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf   

#copie du scrip de lancement du serveur
COPY srcs/start_container.sh /start_container.sh

EXPOSE 5050 

CMD ["/bin/ash", "/start_container.sh" ]

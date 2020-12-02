FROM alpine

RUN apk update
RUN apk upgrade

#installation du serveur nginx et copie de mon fichier de configuration
RUN apk add nginx
ADD srcs/nginx.conf /etc/nginx/
ADD srcs/index.html /var/www
RUN mkdir -p /run/nginx

#génération du certificat et clé privée pour connection htpps
RUN apk add openssl
RUN openssl req -x509 -nodes -subj '/C=FR/ST=LILLE/L=LILLE/O=thvanher/CN=localhost' \
      -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key \
			-out /etc/ssl/certs/selfsigned.crt

#installation de telegraf afin de fournir à influxdb les données d'utilisations des ressources par le container
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf                                                      
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf   

#copie du script de lancement du container
COPY srcs/start_container.sh start_container.sh

EXPOSE 80 443

CMD [ "/bin/ash", "/start_container.sh" ]

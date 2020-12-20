FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add curl
RUN apk add openrc

#instalation de nginx et copie de mon fichier de configuration  
RUN apk add nginx
RUN mkdir -p /run/nginx/
COPY srcs/nginx.conf /etc/nginx/

#installation des paquets php
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session 

#installation de phpMyAdmin et copie de mon fichier de configuration
RUN curl 'https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip' > phpmyadmin.zip
RUN unzip phpmyadmin
RUN rm -rf var/www
RUN mv phpMyAdmin-5.0.2-all-languages /var/www
COPY /srcs/config.inc.php		var/www/

#installation de telegraf afin de fournir à influxdb les données d'utilisation des ressources par le container 
RUN wget 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz'
RUN tar xvf 'telegraf-1.16.0_linux_i386.tar.gz'                                 
RUN mv 'telegraf-1.16.0' telegraf                                               
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
 
#copie du script de lancement du serveur
COPY /srcs/start_container.sh 	start_container.sh

EXPOSE 5000

CMD [ "/bin/ash","/start_container.sh" ]

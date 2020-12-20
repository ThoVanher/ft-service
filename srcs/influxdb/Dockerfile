FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add influxdb
RUN apk add --no-cache --upgrade bash 

#installation de telegraf afin de fournir a influxdb les données d'utilisation des ressources par le container
RUN wget 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz'
RUN tar xvf 'telegraf-1.16.0_linux_i386.tar.gz'                                 
RUN mv 'telegraf-1.16.0' telegraf                                               
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf 

#copie du script de lancement du container
COPY srcs/start_container.sh /start_container.sh

EXPOSE 8086

CMD [ "/bin/ash", "/start_container.sh" ]

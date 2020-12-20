FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add curl 
RUN apk add bash
RUN apk add libc6-compat

#installation de grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz 
RUN tar -zxvf grafana-7.2.1.linux-amd64.tar.gz
RUN mv grafana-7.2.1 grafana
COPY ./srcs/grafana.db ./grafana/data/grafana.db

#installation de telegraf afin de fournir à influxdb les données d'utilisation des ressources par le container
RUN wget 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz'
RUN tar xvf 'telegraf-1.16.0_linux_i386.tar.gz'                                 
RUN mv 'telegraf-1.16.0' telegraf                                               
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
 
#copie du script de lancement du container
COPY srcs/start_container.sh start_container.sh

EXPOSE 3000

CMD [ "/bin/ash", "/start_container.sh" ]

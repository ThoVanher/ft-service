FROM alpine

RUN apk upgrade
RUN apk add
RUN apk add openssl vsftpd curl

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN openssl req -x509 -nodes -subj '/C=FR/ST=LILLE/L=LILLE/O=thvanher/CN=localhost' \
      -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \      
      -out /etc/ssl/certs/vsftpd.crt 

#installation de telegraf afin de fournir à influxdb les données d'utilisations des ressources par le container
RUN wget 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz'
RUN tar xvf 'telegraf-1.16.0_linux_i386.tar.gz'                                 
RUN mv 'telegraf-1.16.0' telegraf                                               
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf  

COPY srcs/start_container.sh start_container.sh

EXPOSE 21 21000-21005

CMD ["/bin/ash", "/start_container.sh"]

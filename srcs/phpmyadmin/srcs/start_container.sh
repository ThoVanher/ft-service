#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-update add php-fpm7 default
rc-service php-fpm7 restart
/telegraf/usr/bin/telegraf &
nginx -g 'daemon off;'

#!bin/sh
telegraf/usr/bin/telegraf &
nginx -g 'pid /tmp/nginx.pid; daemon off;'


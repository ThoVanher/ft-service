#!/bin/sh

php-fpm7&
nginx -g 'pid /tmp/nginx.pid; daemon off;'

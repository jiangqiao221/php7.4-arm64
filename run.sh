#!/bin/sh
mkdir -p /run/nginx
/usr/sbin/nginx
/usr/sbin/php-fpm7
tail -f /etc/hosts

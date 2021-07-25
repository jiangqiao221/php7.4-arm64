FROM alpine:3.14.0
COPY run.sh /

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update  && \
    apk add build-base shadow openssh bash libxml2-dev openssl-dev libjpeg-turbo-dev libpng-dev libxpm-dev freetype-dev gd-dev gettext-dev libmcrypt-dev binutils && \
    addgroup www  && \
    adduser -G www -D -s /sbin/nologin www  && \
    apk add nginx && \
    apk add php7 php7-fpm php7-gd php7-mbstring php7-mcrypt php7-pdo php7-sqlite3 php7-pdo_sqlite && \
    apk del build-base shadow binutils && \
    rm -rf  /var/cache/apk/* && \
    chmod +x /run.sh
EXPOSE  80
ENTRYPOINT ["/run.sh"]

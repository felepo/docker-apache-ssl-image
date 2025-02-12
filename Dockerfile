FROM centos:7

RUN \ 
  yum -y install \ 
    httpd \ 
    php \ 
    php-cli \ 
    php-common \ 
    mod_ssl \ 
    openssl

RUN echo "<?php phpinfo(); ?>" > /var/www/html/test.php

COPY YOU-PHP-PROJECT-PATH /var/www/html

COPY ssl.conf /etc/httpd/conf.d/default.conf

COPY docker.crt /docker.crt

COPY docker.key /docker.key

EXPOSE 443

CMD apachectl -DFOREGROUND

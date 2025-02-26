FROM debian:buster

RUN apt update && apt install -y php php-fpm php-mysql wget

# Ensure PHP-FPM listens on port 9000 instead of a Unix socket
RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|' /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN mkdir -p /var/www/html

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz 
# COPY wp-config.php /var/www/html/

CMD ["php-fpm7.3", "-F"]
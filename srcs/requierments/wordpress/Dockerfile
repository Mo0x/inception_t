FROM debian:buster

RUN apt update && apt install -y php php-fpm php-mysql wget curl

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Configure PHP-FPM
RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|' /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

COPY wp-config.php /var/www/html/wordpress/
COPY init-wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-wordpress.sh

CMD ["/usr/local/bin/init-wordpress.sh"]
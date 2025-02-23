FROM debian:bullseye

RUN apt update && apt install -y php-fpm php-mysql wget

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz && rm latest.tar.gz
COPY wp-config.php /var/www/html//wordpress/

CMD ["php-fpm", -F]
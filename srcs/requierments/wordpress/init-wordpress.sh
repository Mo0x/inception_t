#!/bin/bash

# Wait for database to be ready
while ! mysqladmin ping -h"mariadb" --silent; do
    sleep 1
done

# Check if WordPress is already installed
if ! wp core is-installed --path=/var/www/html/wordpress --allow-root; then
    wp core install --path=/var/www/html/wordpress \
        --url=${DOMAIN_NAME} \
        --title="Inception" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root

    # Create additional user
    wp user create ${WP_USER} ${WP_USER_EMAIL} \
        --role=author \
        --user_pass=${WP_USER_PASSWORD} \
        --path=/var/www/html/wordpress \
        --allow-root
fi
# need to understand what it does

# Start PHP-FPM
exec php-fpm7.3 -F
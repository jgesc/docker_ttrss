# Take the official php image as base
FROM php:7.3-apache


# Update APT and enable SSL mod
RUN apt-get update && \
    a2enmod ssl

# Enable php extensions
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get install -y libicu-dev && \
    docker-php-ext-install intl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pcntl

# Create php symlink
RUN ln -s /usr/local/bin/php /usr/bin/php

# Copy executables
COPY apache2-foreground /usr/local/bin
COPY update_daemon.sh /
RUN chmod 755 /usr/local/bin/apache2-foreground /update_daemon.sh
COPY apache2 /etc/apache2


# Required volumes
VOLUME /var/www/html /var/lib/mysql /etc/ssl

# Required ports
EXPOSE 443/tcp

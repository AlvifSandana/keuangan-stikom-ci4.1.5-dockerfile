FROM php:7.4-apache

LABEL org.opencontainers.image.authors="alvifsandana@gmail.com"

# update & upgrade
RUN apt-get update
RUN apt-get upgrade -y

# install git curl vim zip unzip
RUN apt-get install --fix-missing -y zip unzip
RUN apt-get install --fix-missing -y git curl vim

# install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer self-update --2

# install install-php-extensions 
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# add execute permission
RUN chmod +x /usr/local/bin/install-php-extensions

# install docker php extensions
RUN install-php-extensions gd intl json mbstring mysqlnd mysqli tokenizer xml

# copy apache .conf file 
ADD conf/apache.conf /etc/apache2/sites-available/000-default.conf

# enable RewriteEngine Apache2 module
RUN a2enmod rewrite

RUN apt-get clean \
    && rm -r /var/lib/apt/lists/*

# expose port 86
EXPOSE 81

# create volume
VOLUME ["/var/www/html", "/var/log/apache2", "/etc/apache2"]

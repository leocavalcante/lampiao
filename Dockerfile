FROM php:7.0-apache
MAINTAINER lc@leocavalcante.com

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring zip dom soap pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y wget
ADD install_composer.sh /usr/local/bin/install_composer.sh
RUN ["/usr/local/bin/install_composer.sh"]

FROM php:7.3-apache

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libxml2-dev \
  libpq-dev \
  libzip-dev \
  git \
  zip \
  unzip \
  openssl \
  wget \
  && docker-php-ext-install -j$(nproc) mbstring zip soap mysqli pdo pdo_mysql pdo_pgsql \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd

ADD install_composer.sh /usr/local/bin/install_composer.sh
RUN ["/usr/local/bin/install_composer.sh"]

RUN a2enmod rewrite

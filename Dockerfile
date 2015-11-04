#!/usr/bin/env docker

FROM mychiara/docker-webbase
MAINTAINER Andy Ruck <mychiara+docker@gmail.com>

# Enable PHP 5.6 repo and update apt-get
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C && \
    apt-get update && \

    apt-get install --no-install-recommends -y \
    imagemagick \
    ca-certificates \
    php5-cli \
    php5-dev \
    php5-apcu \
    php5-json \
    php5-pgsql \
    php5-mysql \
    php5-mongo \
    php5-sqlite \
    php5-mcrypt  \
    php5-ldap \
    php5-intl \
    php5-imagick php5-gd \
    php5-curl \
    php5-readline \
    php5-xdebug \
    php5-fpm && \

    curl https://getcomposer.org/installer | php -- && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer && \
    mkdir -p /var/log/php && ln -sf /dev/stdout /var/log/php/error.log && ln -sf /dev/stdout /var/log/php5-fpm.log && \

    apt-get -y autoremove && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy local .inis to the image
COPY files/php.ini /etc/php5/fpm/php.ini
COPY files/php-cli.ini /etc/php5/cli/php.ini
COPY files/php-fpm.conf /etc/php5/fpm/php-fpm.conf

# init system
RUN mkdir -p /etc/service/php-fpm /var/run/php-fpm
ADD /files/start.sh /etc/service/php-fpm/run
RUN chmod +x /etc/service/php-fpm/run

VOLUME "/app"

EXPOSE 9000

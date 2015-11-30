## Basic PHP container for development purposes

The image is derived from my [docker-webbase](https://github.com/mychiara/docker-webbase) image.

It' s using PHP 5.6 and installs some very basic PHP modules.

### PHP modules

* php5-cli 
* php5-dev 
* php5-apcu 
* php5-json 
* php5-pgsql 
* php5-mysql 
* php5-mongo 
* php5-sqlite 
* php5-mcrypt  
* php5-ldap 
* php5-intl 
* php5-imagick 
* php5-gd 
* php5-curl 
* php5-readline 
* php5-twig
* php5-xdebug 

It also includes composer and uses php-fpm by default so it's well suited for usage in conjunction with nginx fastcgi.

## Logging

The logging is redirected to stdout so that the container is aware of what's happening and we have easy access to the logs without the need to log into the running container.

## Volumes

The image sets the ```/app``` volume to be able to access project code from a host or be overiden by a [data-container](https://medium.com/@ramangupta/why-docker-data-containers-are-good-589b3c6c749e).
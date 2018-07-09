FROM php:5.6-apache

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmcrypt-dev git wget sudo subversion mysql-client \
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt zip \

## Installation of phpunit.
  && wget https://phar.phpunit.de/phpunit-5.7.21.phar \
  && chmod +x phpunit-5.7.21.phar \
  && mv phpunit-5.7.21.phar /usr/local/bin/phpunit \

## Installation of wp-cli.
  && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /tmp/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp \
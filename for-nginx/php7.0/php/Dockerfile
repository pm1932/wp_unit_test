FROM primestrategy/kusanagi-php7:7.0.6-1

RUN apk --update add zip git sudo subversion mysql-client \

## Installation of phpunit.
  && wget https://phar.phpunit.de/phpunit-6.3.0.phar \
  && chmod +x phpunit-6.3.0.phar \
  && mv phpunit-6.3.0.phar /usr/local/bin/phpunit \

## Installation of wp-cli.
  && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /tmp/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp

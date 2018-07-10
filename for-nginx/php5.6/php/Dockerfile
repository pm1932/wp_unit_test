FROM primestrategy/kusanagi-php5:5.6.26

RUN apk --update add zip git sudo subversion mysql-client openssl \

## Installation of phpunit.
  && wget https://phar.phpunit.de/phpunit-5.7.21.phar \
  && chmod +x phpunit-5.7.21.phar \
  && mv phpunit-5.7.21.phar /usr/local/bin/phpunit \

## Installation of wp-cli.
  && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /tmp/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp
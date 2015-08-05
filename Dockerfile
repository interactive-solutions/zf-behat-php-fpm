FROM php:5.6-fpm
MAINTAINER Antoine Hedgecock <antoine.hedgecock@gmail.com>

# Get the latest version
RUN apt-get update && apt-get install -y git zlib1g-dev libcurl4-openssl-dev libicu-dev && apt-get clean

# # Download apcu
RUN git clone https://github.com/krakjoe/apcu.git /usr/src/php/ext/apcu

# Install the required extensions
RUN docker-php-ext-install apcu mbstring pdo_mysql zip opcache intl

# Configure the timezone
RUN echo "date.timezone = Europe/Stockholm" > /usr/local/etc/php/php.ini

# Mark as volume
VOLUME /var/www/html

# Change the work dir to it
WORKDIR /var/www/html

# Install the entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]

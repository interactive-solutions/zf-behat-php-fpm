FROM php:5.6-fpm
MAINTAINER Antoine Hedgecock <antoine.hedgecock@gmail.com>

# Get the latest version
RUN apt-get update && apt-get install -y git zlib1g-dev libcurl4-openssl-dev libicu-dev && apt-get clean

# # Download apcu
RUN git clone -b v4.0.8 https://github.com/krakjoe/apcu.git /usr/src/php/ext/apcu

# Download and extract redis
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-2.2.7 /usr/src/php/ext/redis

# Install the required extensions
RUN docker-php-ext-install apcu mbstring pdo_mysql zip opcache intl bcmath redis

# Configure the timezone
RUN echo "date.timezone = Europe/Stockholm" > /usr/local/etc/php/php.ini
RUN echo "memory_limit = 512M" >> /usr/local/etc/php/php.ini

# Mark as volume
VOLUME /var/www/html

# Change the work dir to it
WORKDIR /var/www/html

# Install the entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]

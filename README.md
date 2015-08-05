Zend framework PHP-FPM container for docker
===========================================

Provides a dead simple php-fpm container for docker that supports the basic Zf2 application out of the box

## Usage 

In your `docker-compose.yml` add a section for php

```
php:
    image: interactivesolutions/zf-php-fpm:latest
    links:
        - mysql
    volumes:
        - ./:/var/www/html
```
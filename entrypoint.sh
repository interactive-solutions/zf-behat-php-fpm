#!/bin/bash

# Make the data directly writeable
chown -hR www-data:www-data data/

# Start the fpm server
/usr/local/sbin/php-fpm
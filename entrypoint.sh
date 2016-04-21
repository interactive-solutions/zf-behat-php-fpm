#!/bin/bash

# Make the data directly writeable
if [ -d "/var/www/html/data" ]; then
	chmod -R 777 /var/www/html/data/
fi

exec "$@"

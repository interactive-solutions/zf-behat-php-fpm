#!/bin/bash

# Make the data directly writeable
chown -hR www-data:www-data data/

exec "$@"
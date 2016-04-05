#!/bin/bash

# Make the data directly writeable
chmod -r 777 data/

exec "$@"

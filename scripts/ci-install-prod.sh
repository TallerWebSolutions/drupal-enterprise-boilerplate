#!/bin/bash

set -e

docker-compose run --rm devtools \
  composer install --no-dev --prefer-dist --optimize-autoloader

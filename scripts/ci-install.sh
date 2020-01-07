#!/bin/bash

set -e

docker-compose run --rm devtools \
  composer install --prefer-dist

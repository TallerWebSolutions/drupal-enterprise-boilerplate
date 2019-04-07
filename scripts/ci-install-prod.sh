#!/bin/bash

set -e

docker-compose run --entrypoint ./docker/run-entrypoint.sh -w /taller/app --rm app \
  composer install --no-dev --prefer-dist --optimize-autoloader

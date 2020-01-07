#!/bin/bash

set -e

docker-compose run --rm devtools \
  ./bin/phpcs ./web/modules/custom

docker-compose run --rm devtools \
  ./bin/phpcs ./web/modules/sandbox

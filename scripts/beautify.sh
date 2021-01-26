#!/bin/bash

set -e

docker-compose run --rm devtools \
  ./bin/phpcbf --ignore=node_modules ./web/modules/custom ./web/modules/sandbox ./web/themes/custom

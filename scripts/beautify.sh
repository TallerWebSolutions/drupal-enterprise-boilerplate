#!/bin/bash

set -e

docker-compose run --rm devtools \
  ./bin/phpcbf ./web/modules/custom

docker-compose run --rm devtools \
  ./bin/phpcbf ./web/modules/sandbox

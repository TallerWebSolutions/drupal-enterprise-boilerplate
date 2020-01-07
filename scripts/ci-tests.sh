#!/bin/bash

set -e

docker-compose run --rm devtools \
  ./bin/phpunit --testsuite=custom --debug --verbose --colors

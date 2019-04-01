#!/bin/bash

set -e

docker-compose run --entrypoint ./docker/run-entrypoint.sh -w /taller/app --rm app \
  ./bin/phpcbf ./web/modules/custom

docker-compose run --entrypoint ./docker/run-entrypoint.sh -w /taller/app --rm app \
  ./bin/phpcbf ./web/modules/sandbox

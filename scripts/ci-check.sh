#!/bin/bash

COMPOSER_LOCK_OUTDATED=$(docker-compose run --entrypoint ./docker/run-entrypoint.sh -w /taller/app --rm app \
  composer validate --no-check-all --no-check-publish | grep 'The lock file is not up to date with the latest changes in composer.json')

set -e

if [[ ! -z "$COMPOSER_LOCK_OUTDATED" ]]; then
  echo '[ERROR] The composer.lock file is not up to date with composer.json, execute "composer update nothing".'
  exit 1
fi

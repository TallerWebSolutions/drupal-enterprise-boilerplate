#!/bin/bash

git config --global core.autocrlf true
make ci-check
make ci-install
make ci-tests
make ci-install-prod
make ci-deploy
make clean
docker volume ls -qf dangling=true | xargs -r docker volume rm
docker-cache snapshot

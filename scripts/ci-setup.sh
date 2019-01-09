#!/bin/bash

export GROUP_ID=$(id -g)
docker-cache restore
export USER_ID=$(id -u)
git config --global user.email "GIT_USER_EMAIL"
git config --global user.name "GIT_USER_NAME"

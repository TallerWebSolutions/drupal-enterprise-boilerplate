#!/bin/bash

set -e

ACQUIA_DIR=/home/runner/CI_ACQUIA_DIR

ssh-keyscan ACQUIA_GIT_DOMAIN >> /home/runner/.ssh/known_hosts

git clone --branch master ACQUIA_GIT_REPO $ACQUIA_DIR

# Checkout to the branch, if doesn't exit create and checkout to it.
(
  cd $ACQUIA_DIR

  if [[ `git branch -a | grep $BRANCH_NAME` ]]; then
    git checkout ${BRANCH_NAME}
  else
    git checkout -b ${BRANCH_NAME}
  fi
)

# Remove git submodules.
find $SEMAPHORE_PROJECT_DIR -type d -name ".git" | xargs sudo rm -rf

# Remove old directories.
sudo rm -Rf $ACQUIA_DIR/docroot
sudo rm -Rf $ACQUIA_DIR/config
sudo rm -Rf $ACQUIA_DIR/hooks
sudo rm -Rf $ACQUIA_DIR/vendor
sudo rm -Rf $ACQUIA_DIR/bin
sudo rm -Rf $ACQUIA_DIR/composer.json
sudo rm -Rf $ACQUIA_DIR/composer.lock
sudo rm -Rf $ACQUIA_DIR/README.md

# Copy new directories.
cp -r ./web $ACQUIA_DIR/docroot
cp -r ./config $ACQUIA_DIR/config
cp -r ./scripts/acquia_hooks $ACQUIA_DIR/hooks
cp -r ./vendor $ACQUIA_DIR/vendor
cp -r ./bin $ACQUIA_DIR/bin
cp ./composer.json $ACQUIA_DIR/composer.json
cp ./composer.lock $ACQUIA_DIR/composer.lock
cp ./README.md $ACQUIA_DIR/README.md

# Make Acquia hooks executable.
sudo chmod -R +x $ACQUIA_DIR/hooks

# Configure GIT.
git config --global core.autocrlf true
git config --global user.email "GIT_USER_EMAIL"
git config --global user.name "GIT_USER_NAME"

(
  cd $ACQUIA_DIR

  # Add all the things.
  git add --all .

  # Commit only if there's something new.
  if [ ! "$(git status | grep 'nothing to commit')" ]; then
    echo 'Has things to commit.'

    git commit -m "Deploy by Taller's SemaphoreCI: $REVISION."
    git push origin $BRANCH_NAME
  else
    echo 'Nothing to commit.'
  fi
)

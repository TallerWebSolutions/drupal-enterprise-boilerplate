#!/bin/bash

set -e

drush updb -y
drush config-import --partial -y
drush cr

#!/bin/sh
#
# Cloud Hook: post-code-deploy
#
# The post-code-deploy hook is run whenever you use the Workflow page to
# deploy new code to an environment, either via drag-drop or by selecting
# an existing branch or tag from the Code drop-down list. See
# ../README.md for details.
#
# Usage: post-code-deploy site target-env source-branch deployed-tag repo-url
#                         repo-type

# @TODO Uncomment this when the drush9 bug is fixed.
# set -e

# Map the script inputs to convenient names.
site="$1"
target_env="$2"
source_branch="$3"
deployed_tag="$4"
repo_url="$5"
repo_type="$6"

drush_alias=$site'.'$target_env

(
  cd /var/www/html/$drush_alias/docroot

  ../bin/drush @$drush_alias updb -y -vdd
  ../bin/drush @$drush_alias config-import --partial sync -y -vdd
  ../bin/drush @$drush_alias cr -vdd
  ../bin/drush @$drush_alias entity-updates -y -vdd
)

if [ "$source_branch" != "$deployed_tag" ]; then
  echo "[$(date)] $site.$target_env: Deploying branch $source_branch as $deployed_tag."
else
  echo "[$(date)] $site.$target_env: Deployed $deployed_tag."
fi

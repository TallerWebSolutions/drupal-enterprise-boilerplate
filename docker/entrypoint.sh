#!/bin/bash

set -e

# Source NVM scripts

source /taller/.nvm/nvm.sh

# Start services and loggers.
# ---------------------------

sudo service apache2 restart > /tmp/apache2.log

# Await database.
# ---------------.

while ! nc -q 1 database-host 3306 </dev/null; do sleep 3; done

echo ""
echo "------------------------------------"
echo "------- Database connected -------"
echo "------------------------------------"
echo ""

# Install Drupal, if not installed yet.
# ---------------------------------------

if [ ! -f /taller/app/web/sites/default/settings.local.php ]
then
  echo ""
  echo "------------------------------------"
  echo "-- Installing site from scratch --"
  echo "------------------------------------"
  echo ""

  # 1 - Install core and other dependencies.
  cd /taller/app/
  composer install

  # 2 - Create basic files and ensure permissions.
  mkdir -p /taller/app/web/sites/default/files

  # 3 - Copy configuration files.
  sudo cp /taller/app/web/sites/template.settings.local.php /taller/app/web/sites/default/settings.local.php
  sudo chmod -R 777 /taller/app/web/sites/default/settings.local.php

  # 4 - Configure database connection based on docker-compose env variables.
  sed -i "s/{MYSQL_DATABASE}/${MYSQL_DATABASE}/g" /taller/app/web/sites/default/settings.local.php
  sed -i "s/{MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" /taller/app/web/sites/default/settings.local.php
  sed -i "s/{MYSQL_USER}/${MYSQL_USER}/g" /taller/app/web/sites/default/settings.local.php

  # 5 - Install standard profile.
  cd /taller/app/web
  # Set PHP_OPTIONS environment variable to fix sendmail error.
  /usr/bin/env PHP_OPTIONS="-d sendmail_path=`which true`" ../bin/drush si standard --site-name="DRUPAL_SITE_NAME" --account-name="admin" --account-pass="123456" -y

  # 6 - Import configs, if available.
  if [ -f /taller/app/site-id ]
  then
    ../bin/drush config-import --partial -y
  fi

fi

echo -e '\nPATH="/taller/app/vendor/bin:$PATH"' >> /taller/.bashrc

# Ensure permissions are correct.
# ---------------------------------------
sudo chmod -R 777 /taller/app/web/sites/default/files
sudo chmod 777 /taller/app/web/sites/default/settings.local.php
sudo chmod +w -R /taller/app/web/sites/default

echo ""
echo "------------------------------------"
echo "-- Virtual Marchine ready to work --"
echo "------------------------------------"
echo ""
echo "Access your Drupal site at http://$(hostname -i)"
echo ""

exec "$@"


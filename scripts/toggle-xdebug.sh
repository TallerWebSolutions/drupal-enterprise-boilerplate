#!/bin/bash

set -e

restartApache() {
  sudo service apache2 restart
}

if [[ -z `ls -l /etc/php/7.2/apache2/conf.d/ | grep xdebug` ]]; then
  sudo phpenmod xdebug
  echo -e '\n\nXDebug: ON.\n'
  restartApache
else
  sudo phpdismod xdebug
  echo -e '\nXDebug: OFF.\n'
  restartApache
fi

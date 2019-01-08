#!/bin/bash

set -e

source /taller/.nvm/nvm.sh

echo -e '\nPATH="/taller/app/src/web/themes/custom/webapp/node_modules/.bin:$PATH"' >> /taller/.bashrc
echo -e '\nPATH="/taller/app/src/vendor/bin:$PATH"' >> /taller/.bashrc

sudo chown -R taller:taller .
sudo chown -R taller:taller ./*

echo ""
echo "------------------------------------------------"
echo "--------- Running on a stale container ---------"
echo "------------------------------------------------"
echo ""

exec "$@"

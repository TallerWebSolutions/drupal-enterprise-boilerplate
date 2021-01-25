#!/bin/bash

set -e

DATABASE_DUMP="/taller/app/temp/local_database.sql"
[ ! -f $DATABASE_DUMP ] && { echo "$DATABASE_DUMP not found."; exit 1; }

mysql --host=database-host --user=root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < $DATABASE_DUMP
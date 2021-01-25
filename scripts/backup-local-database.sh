#!/bin/bash

set -e

BACKUP_NAME="backup_local_database_$(date +"%Y%m%d%H%M%S").sql"
mysqldump --host=database-host --user=root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE > /taller/app/temp/$BACKUP_NAME
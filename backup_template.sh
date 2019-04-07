#!/bin/bash

# Create backup file of bookstack database. Intended to run daily. Will overwrite daily backup and keep one backup per month until they're older than a year.

backup_path=/opt/bookstack_raspie/bookstack_db_backup
mkdir -p $backup_path

mariadb_container_id=$(docker ps | grep bookstack_db_container | awk '{print $1;}')
year_month_prefix=$(date +'%Y.%m')

docker exec ${mariadb_container_id} /usr/bin/mysqldump -u root --password=__root_password__ bookstackapp > "$backup_path/${year_month_prefix}_bookstack_db_backup.sql"

# Remove backup-files that are older than a year
/usr/bin/find $backup_path/ -type f -name '*_bookstack_db_backup.sql' -mtime +365 -exec rm {} \;
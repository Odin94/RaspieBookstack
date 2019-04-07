#!/bin/bash

# Usage: restore.sh <filename.sql>

backup_file=$1
mariadb_container_id=$(docker ps | grep bookstack_db_container | awk '{print $1;}')

docker exec -i $mariadb_container_id /usr/bin/mysql -u root --password=__root_password__ bookstackapp < $backup_file
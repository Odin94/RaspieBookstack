#!/bin/bash
set -e

echo "Replacing variables in docker-compose_template.yaml and backup_template.sh"

dir=`dirname $0`
source "$dir/variables.sh"

mkdir -p "actual"

echo "Will write output to $dir/actual"


sed "s/__root_password__/${mysql_root_password}/g; s/__user_password__/${user_password}/g;" $dir/docker-compose_template.yaml > $dir/actual/docker-compose.yaml
sed "s/__root_password__/${mysql_root_password}/g;" $dir/backup_template.sh > $dir/actual/backup.sh
sed "s/__root_password__/${mysql_root_password}/g;" $dir/restore_template.sh > $dir/actual/restore.sh

chmod +x $dir/actual/backup.sh
chmod +x $dir/actual/restore.sh

echo "done."

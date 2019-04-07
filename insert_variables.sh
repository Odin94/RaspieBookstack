#!/bin/bash
set -e

echo "Replacing variables in docker-compose_template.yaml and backup_template.sh"

dir=`dirname $0`
source "$dir/variables.sh"

scripts_dir="backup_scripts"
mkdir -p $scripts_dir

bookstack_dir="bookstack"
mkdir -p $bookstack_dir

echo "Will write output to $dir/$scripts_dir and $dir/$bookstack_dir"


sed "s/__root_password__/${mysql_root_password}/g; s/__user_password__/${user_password}/g;" $dir/docker-compose_template.yaml > $dir/$bookstack_dir/docker-compose.yaml
sed "s/__root_password__/${mysql_root_password}/g;" $dir/backup_template.sh > $dir/$scripts_dir/backup.sh
sed "s/__root_password__/${mysql_root_password}/g;" $dir/restore_template.sh > $dir/$scripts_dir/restore.sh

chmod +x $dir/$scripts_dir/backup.sh
chmod +x $dir/$scripts_dir/restore.sh

echo "done. You can now run docker-compose up in \'$bookstack_dir\'"

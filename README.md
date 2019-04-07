## Bookstack setup for Raspberry Pi

Setup for running bookstack on Raspberry Pi running Raspbian with automated backups of the database. Uses docker images by [LinuxServer](https://LinuxServer.io).

### Requirements

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Setup
* Create a `variables.sh` file based in `variables_template.sh`
* Run `insert_variables.sh` to create `docker-compose.yaml` and `backup.sh` with your chosen variables
* Change directory to `actual` and run `docker-compose up`. This will download the required docker images and start a MariaDB service and a bookstack service
* Your bookstack service can now be reached on port `6875` and will automatically start on reboot unless you run `docker-compose down`
* To create daily DB backups, move `actual/backup.sh` into `/etc/cron.daily`. Will overwrite the daily backup every day but keep one per month. Backups older than a year are automatically deleted
* Manually upload the backup files that will be created in `/opt/bookstack_raspie/bookstack_db_backup/` to a backup service of your choice

Note: After running `docker-compose up` for the first time the bookstack_container will take a while to set up the database. Give it 5min at least.
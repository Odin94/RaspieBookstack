## Bookstack setup for Raspberry Pi

Setup for running bookstack on raspberry pi with automated backups of the database. Uses docker images by [LinuxServer](LinuxServer.io).

### Requirements
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Setup
* Create a `variables.sh` file based in `variables_template.sh`
* Run `insert_variables.sh` to create `docker-compose.yaml` and `backup.sh` with your chosen variables
* Change directory to `actual` and run `docker-compose up`. This will download the required docker images and start a MariaDB service and a bookstack service
* Your bookstack service can now be reached on port 6875
* To create daily DB backups, move `actual/backup.sh` into `/etc/cron.daily`. Will overwrite the daily backup every day but keep one per month. Backups older than a year are automatically deleted
* Manually upload the backup files that will be created in `/opt/bookstack_raspie/bookstack_db_backup/` to a backup service of your choice
#!/usr/bin/env bash

source .env

current_datetime=$(date +%Y%m%d%H%M%S)
filename=mysql_$current_datetime
mysql_container_id=$(docker-compose ps -q mysql)

docker-compose exec mysql bash -c "mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /tmp/docker_backup.sql"
docker cp $mysql_container_id:/tmp/docker_backup.sql ./backups/$filename.sql
docker-compose exec mysql bash -c "rm /tmp/docker_backup.sql"

echo "Backup has been created: $filename"

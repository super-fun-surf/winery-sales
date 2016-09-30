#!/bin/sh

_now=$(date +"%m-%d-%Y")
_file="/var/www/backup/winery-$_now.dump"
echo "Starting backup to $_file..."

sudo -u postgres pg_dump --oids --no-owner -Fc --disable-triggers --clean -f $_file winery

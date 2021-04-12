#!/bin/sh
date=`date "+%Y-%m-%dT%H-%M"`
rsync -aP --link-dest=/Volumes/Tim\ Backups/current /Volumes/Documents /Volumes/Tim\ Backups/backup-$date
rm -f /Volumes/Tim\ Backups/current
ln -s back-$date /Volumes/Tim\ Backups/current
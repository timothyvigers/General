#!/bin/bash
rsync -auv Documents/ /run/media/tim/Backups/Documents
rsync -auv Music/ /run/media/tim/Backups/Music
rsync -auv GitHub/ /run/media/tim/Backups/GitHub
rsync -auv Dropbox/ /run/media/tim/Backups/Dropbox
rsync -auv Pictures/ /run/media/tim/Backups/Pictures
rsync -auv Videos/ /run/media/tim/Backups/Videos
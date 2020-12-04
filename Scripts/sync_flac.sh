#!/bin/bash
sudo mount -t drvfs F: /mnt/f # Mount SD drive
sudo rsync -auv /mnt/c/Users/timbv/Dropbox/Music/ /mnt/f/MUSIC/ # Sync Dropbox to player
# sudo rsync -auv /mnt/c/Users/timbv/Dropbox/Music/ /mnt/f/MUSIC/ # Player to Dropbox

#!/bin/bash
cd /home/tim/.local/share/Cryptomator/mnt/Vault/Music
find . -type f ! -name "*.flac" ! -name "*.mp3" -delete
find . -type d -empty -delete
cd ~
rsync -auv Music/ /media/tim/SD_CARD/MUSIC/ --delete
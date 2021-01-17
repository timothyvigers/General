#!/bin/bash
cd Music
find . -type f ! -name "*.flac" ! -name "*.mp3" -delete
rsync -auv Music/ /media/tim/SD_CARD/MUSIC/ --delete
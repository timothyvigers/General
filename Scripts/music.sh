#!/bin/bash
cd /Volumes/Documents/Music
find . -type f ! -name "*.flac" ! -name "*.mp3" -delete
find . -type d -empty -delete

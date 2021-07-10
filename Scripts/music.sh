#!/bin/bash
# Remove all non-music files
find Music -type f -not -iname "*.mp3" -and -not -iname "*.flac" -and -not -iname "*.ogg" \
    -and -not -iname "*.MP3" -and -not -iname "*.FLAC" -and -not -iname "*.OGG" \
    -delete
# Convert to vorbis for phone
flac2all vorbis --vorbis-options='quality=8' Music/FLAC -o Music/
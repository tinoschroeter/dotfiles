#!/bin/bash

if [ -n "$1" ]; then
  youtube-dl --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' "$1"
else
  echo "missing youtube url..."
fi

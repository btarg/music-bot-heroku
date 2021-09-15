#!/bin/bash

# Get latest version and download if necessary
FILE_VER=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
FILE_NAME="JMusicBot-${FILE_VER}.jar"

if [ -f "$FILE_NAME" ]; then
    echo "$FILE_NAME exists."
else 
    echo "$FILE_NAME does not exist. Downloading..."
    FILE_URL=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -oP '"browser_download_url": "\K(.*)(?=")')
    echo "${FILE_URL}" | xargs wget
fi

echo "${FILE_NAME}" | xargs java -Dnogui=true -jar

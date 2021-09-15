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

# Get base64 encoded config from heroku and decode it into a text file
echo $base64_encoded_config | base64 -d > config.txt

# Run the jar
echo "${FILE_NAME}" | xargs java -Dnogui=true -jar

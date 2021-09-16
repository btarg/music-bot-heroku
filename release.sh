#!/bin/bash

# Get latest version and download if necessary
FILE_NAME=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -oP '"name": "\K(.*)(?=")')

# Kill existing JMusicBots to avoid multiple bots running at once
kill $(jps | grep JMusicBot | awk '{print $1}')

if [ -f "$FILE_NAME" ]; then
    echo "$FILE_NAME exists."
else 
    echo "$FILE_NAME does not exist. Downloading..."
    FILE_URL=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -oP '"browser_download_url": "\K(.*)(?=")')
    echo "${FILE_URL}" | xargs wget
fi

if [ -z "$base64_encoded_config" ]
then
    echo "Please define a config following the instructions in the README."
else 
    echo "Config defined"
    # Get base64 encoded config from heroku and decode it into a text file
    echo $base64_encoded_config | base64 -d > config.txt

    # Run the jar
    echo "${FILE_NAME}" | xargs java -Dnogui=true -jar
fi

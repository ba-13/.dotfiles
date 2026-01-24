#!/bin/bash

DIST=deb
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
URLBASE="https://discord.com/api/download?platform=linux&format=${DIST}"
# FILENAME=${DIR}/latest.${DIST}
FILENAME=/tmp/latest.${DIST}
wget --show-progress -O $FILENAME $URLBASE 
RESULT="$?"
if (( RESULT != 0 )); then
    echo "Failed to download";
    exit 1;
fi
printf "Downloading finished.\n\n";
echo "Closing Discord...";
for pid in $(pidof Discord); do kill -9 $pid; done
echo "Discord closed."

echo "Installing latest version...";
sudo dpkg -i $FILENAME;
echo "Installation finished.";
exit;

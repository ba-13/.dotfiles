#!/bin/bash

URLBASE="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64"
FILENAME=/tmp/zotero.tar.bz2
EXTRACTED_FILENAME=Zotero_linux-x86_64
wget --show-progress -O $FILENAME $URLBASE 
RESULT="$?"
if (( RESULT != 0 )); then
    echo "Failed to download";
    exit 1;
fi
printf "Downloading finished.\n\n";
echo "Closing Zotero...";
for pid in $(pidof zotero-bin); do kill -9 $pid; done
echo "Zotero closed."

echo "Installing latest version...";
cd /tmp/
tar -xvf $FILENAME
sudo rm -rf /opt/zotero
sudo mv $EXTRACTED_FILENAME /opt/zotero/
/opt/zotero/set_launcher_icon # run icon setting script
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
echo "Installation finished.";
exit;

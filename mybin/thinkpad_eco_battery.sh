#!/bin/bash

echo "Remember to uncomment lines in /etc/tlp.conf"
if [ $1 -eq 0 ]; then
    echo "Set to full battery mode"
    sudo sed -i "s/START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=0/" /etc/tlp.conf;
    sudo sed -i "s/STOP_CHARGE_THRESH_BAT0.*/STOP_CHARGE_THRESH_BAT0=100/" /etc/tlp.conf;
    sudo tlp start;
elif [ $1 -eq 1 ]; then
    echo "Set to eco battery mode"
    sudo sed -i "s/START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=60/" /etc/tlp.conf;
    sudo sed -i "s/STOP_CHARGE_THRESH_BAT0.*/STOP_CHARGE_THRESH_BAT0=80/" /etc/tlp.conf;
    sudo tlp start;
fi

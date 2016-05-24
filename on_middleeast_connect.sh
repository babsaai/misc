#!/bin/bash
# This script was created for running other scripts on connecting to a specific network
# should be moved to /etc/NetworkManager/dispatcher.d/
# sudo chown root:root on_middleeast_connect.sh
# sudo chmod go-w on_middleeast_connect.sh

INTERFACE=$1
ACTION=$2

SSID="MiddleEast"
ESSID=`iwconfig $INTERFACE | grep ESSID | cut -d":" -f2 | sed 's/^[^"]*"\|"[^"]*$//g'`

if [ "$INTERFACE" == "wlan1" ]; then
  if [ "$SSID" == "$ESSID" ] && [ "$ACTION" == "up" ]; then
    notify-send -t 10000 "Welcome Dear. Starting nasty apps .."

    # run qbittorent
    /usr/bin/qbittorrent
  fi
fi


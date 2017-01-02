#!/bin/sh

echo "run this script as root"

echo "bring wlan0 up"

ifconfig wlan0 up

echo "list devices"

ip link

echo "list available networks"

iw dev wlan0 scan | grep "SSID"


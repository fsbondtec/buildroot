#!/bin/sh

echo "run this script as root"

echo "bring wlan0 up"

ifconfig wlan0 down

echo "list devices"

ip link

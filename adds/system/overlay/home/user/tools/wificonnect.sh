#!/bin/sh

echo "connect to wireless network run this as root"

if [ "$#" -ne 2 ]; then
  echo "Usage $0 <SSID> <PASSPHRASE>"
  exit 1
fi

echo "create passphrase"
wpa_passphrase $1 $2 > $1.conf

echo "connect to wlan0"
wpa_supplicant -B -i wlan0 -c $1.conf

echo "get ip address"
dhcpcd wlan0

ifconfig wlan0

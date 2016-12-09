#!/bin/sh

echo "start checks"

kernel="SMP PREEMPT RT"
echo "check if kernel version contains string '${kernel}'"
uname -v | grep "${kernel}" > /dev/null 2>&1 || echo "!!!!Check Failed!!!!"

echo "check if /dev/i2c-1 device exists"
ls -la "/dev/i2c-1" > /dev/null 2>&1 || echo "!!!!Check Failed!!!!"

echo "check if /dev/spidev0.0 device exists"
ls -la "/dev/spidev0.0" > /dev/null 2>&1 || echo "!!!!Check Failed!!!!"

echo "check if ssh daemon is running"
ps -A | grep "sshd" > /dev/null 2>&1 || echo "!!!!Check Failed!!!!"

echo "...checks finished"

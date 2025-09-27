#!/bin/bash

STATUS_FILE="/tmp/power_saver_enabled"

if [ -f "$STATUS_FILE" ]; then
    powerprofilesctl set balanced
    rm "$STATUS_FILE"
else
    powerprofilesctl set power-saver
    touch "$STATUS_FILE"
fi

pkill -SIGRTMIN+8 waybar

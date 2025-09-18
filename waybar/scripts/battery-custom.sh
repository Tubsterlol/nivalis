#!/bin/bash

STATUS_FILE="/tmp/power_saver_enabled"
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Get battery level
capacity=$(cat "$BATTERY_PATH/capacity" 2>/dev/null || echo "N/A")

# Set icon based on percentage
if [ "$capacity" -ge 95 ]; then
    icon=""
elif [ "$capacity" -ge 75 ]; then
    icon=""
elif [ "$capacity" -ge 50 ]; then
    icon=""
elif [ "$capacity" -ge 25 ]; then
    icon=""
else
    icon=""
fi

# If power saver is enabled, set class
if [ -f "$STATUS_FILE" ]; then
    echo "{\"text\": \"$icon $capacity%\", \"class\": \"power-saver\"}"
else
    echo "{\"text\": \"$icon $capacity%\"}"
fi

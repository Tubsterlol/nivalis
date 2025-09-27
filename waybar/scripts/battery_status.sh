#!/bin/bash

STATUS_FILE="/tmp/power_saver_enabled"

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
CHARGING=$(cat /sys/class/power_supply/BAT0/status)

if [ "$CAPACITY" -ge 80 ]; then ICON="󰁹"
elif [ "$CAPACITY" -ge 60 ]; then ICON="󰂂"
elif [ "$CAPACITY" -ge 40 ]; then ICON="󰂀"
elif [ "$CAPACITY" -ge 20 ]; then ICON="󰁾"
else ICON="󰁺"
fi

if [ "$CHARGING" = "Charging" ]; then
    ICON="󰂄"
fi

if [ -f "$STATUS_FILE" ]; then
    CLASS="powersaver"
else
    CLASS="normal"
fi

# Use printf to output valid JSON
printf '{"text": "%s %s%%", "class": "%s"}\n' "$ICON" "$CAPACITY" "$CLASS"

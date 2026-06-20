#!/usr/bin/env bash

theme="$HOME/.config/i3/rofi/style-1.rasi"

option1="󰍡 Notifications"
option2="󰂛 Toggle DND"
option3="󰎟 Clear All"

chosen=$(printf "%s\n%s\n%s\n" \
"$option1" \
"$option2" \
"$option3" | rofi \
-dmenu \
-p "Notifications" \
-theme "$theme")

case "$chosen" in
    "$option1")
        dunstctl history-pop
        ;;
    "$option2")
        paused=$(dunstctl is-paused)

        if [ "$paused" = "true" ]; then
            dunstctl set-paused false
            notify-send "Notifications Enabled"
        else
            dunstctl set-paused true
            notify-send "Do Not Disturb Enabled"
        fi
        ;;
    "$option3")
        dunstctl close-all
        ;;
esac

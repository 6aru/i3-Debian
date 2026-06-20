#!/usr/bin/env bash

theme="$HOME/.config/i3/rofi/notifications.rasi"

menu=$(
{
echo "󰋚 Show Latest Notification"
echo "󰨚 Toggle Do Not Disturb"
echo "󰎟 Clear Notifications"
echo "────────────────────"

```
dunstctl history | jq -r '
    .data[0][] |
    .message.data
' 2>/dev/null
```

} | rofi 
-dmenu 
-i 
-p "Notification Center" 
-theme "$theme"
)

case "$menu" in
"󰂚 Show Latest Notification")
dunstctl history-pop
;;
"󰂛 Toggle Do Not Disturb")
if [ "$(dunstctl is-paused)" = "true" ]; then
dunstctl set-paused false
notify-send "Notifications Enabled"
else
dunstctl set-paused true
notify-send "Do Not Disturb Enabled"
fi
;;
"󰎟 Clear Notifications")
dunstctl close-all
;;
esac

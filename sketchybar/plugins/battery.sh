#!/usr/bin/env sh

# Battery percent + icon. Triggered by periodic updates, wake, and
# power_source_change events.

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
source "$CONFIG_DIR/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR=$GREEN
else
  case "$PERCENTAGE" in
    9[0-9]|100) ICON="󰁹"; COLOR=$WHITE ;;
    [6-8][0-9]) ICON="󰂀"; COLOR=$WHITE ;;
    [3-5][0-9]) ICON="󰁾"; COLOR=$YELLOW ;;
    [1-2][0-9]) ICON="󰁻"; COLOR=$ORANGE ;;
    *)          ICON="󰂎"; COLOR=$RED ;;
  esac
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"

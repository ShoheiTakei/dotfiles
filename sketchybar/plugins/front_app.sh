#!/bin/bash

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
source "$CONFIG_DIR/helpers/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  __icon_map "$INFO"

  if [ -n "$icon_result" ] && [ "$icon_result" != ":default:" ]; then
    sketchybar --animate sin 6 --set "$NAME" label="$INFO" icon="$icon_result"
  else
    sketchybar --animate sin 6 --set "$NAME" label="$INFO" icon=":default:"
  fi
fi

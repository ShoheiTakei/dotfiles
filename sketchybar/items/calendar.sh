#!/bin/bash

# Click-to-launch Notion Calendar item (uses sketchybar for the 📅 icon).

source "$CONFIG_DIR/colors.sh"

calendar=(
  icon="📅"
  icon.font="HackGen35Console NF:Bold:14.0"
  icon.color=$WHITE
  label.drawing=off
  click_script="open -a 'Notion Calendar'"
)

sketchybar --add item calendar right \
           --set calendar "${calendar[@]}"

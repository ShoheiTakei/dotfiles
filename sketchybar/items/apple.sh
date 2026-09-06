#!/bin/bash

source "$CONFIG_DIR/colors.sh"

POPUP_OFF="sketchybar --set apple.icon popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

# Machine label shown next to the hammer icon. Adjust as desired.
MACHINE_LABEL="MacBook"
HAMMER_ICON=$'\xef\x9b\xa3'  # nf-fa-hammer U+F6E3 (UTF-8, bash 3.2 compat)

apple_icon=(
  icon="$HAMMER_ICON"
  icon.drawing=on
  icon.font="MesloLGS NF:Bold:14.0"
  icon.color=$YELLOW
  label="$MACHINE_LABEL"
  label.drawing=on
  label.font="HackGen35Console NF:Bold:13.0"
  label.color=$WHITE
  background.color=$BACKGROUND_2
  background.corner_radius=8
  background.height=24
  background.drawing=on
  padding_right=4
  padding_left=10
  click_script="$POPUP_CLICK_SCRIPT"
)

apple_prefs=(
  icon="⚙︎"
  label="System Settings"
  click_script="open 'x-apple.systempreferences:'; $POPUP_OFF"
)

apple_activity=(
  icon="📊"
  label="Activity Monitor"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon="🔒"
  label="Lock Screen"
  click_script="open -a ScreenSaverEngine; $POPUP_OFF"
)

sketchybar --add item apple.icon left                  \
           --set apple.icon "${apple_icon[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.icon     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.apple.icon  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.lock popup.apple.icon      \
           --set apple.lock "${apple_lock[@]}"

#!/bin/sh
# Alacritty has no opacity keybinding action, so toggle it over the IPC socket.
set -e
A=/Applications/Alacritty.app/Contents/MacOS/alacritty
S=${TMPDIR:-/tmp}/alacritty-opacity
[ "$(cat "$S" 2>/dev/null)" = "1" ] && v=0.9 || v=1
"$A" msg config -w -1 "window.opacity=$v"
[ "$v" = "1" ] && echo 1 > "$S" || echo 0 > "$S"

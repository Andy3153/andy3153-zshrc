#!/bin/zsh
#
# Simple poweroff menu using rofi. First rofi script I made
#

eval "$(echo -e "systemctl poweroff\nsystemctl reboot\nsystemctl suspend" | rofi -lines 3 -dmenu)"

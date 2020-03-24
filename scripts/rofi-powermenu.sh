#!/bin/zsh
#
# Simple poweroff menu using rofi. First rofi script I made
#

eval "$(echo -e "poweroff\nreboot\nsuspend" | rofi -lines 3 -dmenu)"

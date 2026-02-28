#!/usr/bin/env bash

# Get current positions from swaymsg
POS_L=$(swaymsg -t get_outputs | jq -r '.[] | select(.name=="DP-1") | .rect.x')
# If DP-1 is currently at 0 → normal layout, else swapped

if [ "$POS_L" -eq 0 ]; then
    # Currently normal → swap: put DP-2 on the left
    swaymsg output DP-2 pos 0 0
    swaymsg output DP-1 pos 2560 0
else
    # Currently swapped → restore normal
    swaymsg output DP-1 pos 0 0
    swaymsg output DP-2 pos 2560 0
fi

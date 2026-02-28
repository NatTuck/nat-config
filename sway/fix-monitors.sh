#!/usr/bin/env bash
set -euo pipefail

# Wake monitors
swaymsg "output * dpms on"

# Detect current left/right by position (x coord)
LEFT_OUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.active and .rect.x == 0) | .name // empty')
RIGHT_OUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.active and .rect.x == 2560) | .name // empty')

# If detection failed or they are swapped, fix positions
if [ -z "$LEFT_OUT" ] || [ -z "$RIGHT_OUT" ]; then
    # Fallback: force original order
    swaymsg output DP-1 pos 0 0
    swaymsg output DP-2 pos 2560 0
    LEFT_OUT=DP-1
    RIGHT_OUT=DP-2
else
    # Check if they are actually backwards
    CURRENT_X=$(swaymsg -t get_outputs | jq -r --arg n "$LEFT_OUT" '.[] | select(.name == $n) | .rect.x')
    if [ "$CURRENT_X" -eq 2560 ]; then
        swaymsg output "$LEFT_OUT"  pos 2560 0
        swaymsg output "$RIGHT_OUT" pos 0 0
        # swap variables for the moves below
        tmp="$LEFT_OUT"; LEFT_OUT="$RIGHT_OUT"; RIGHT_OUT="$tmp"
    fi
fi

# === 100% safe workspace moves ===
# Move everything that belongs on the right monitor → left, and vice-versa
move_ws() {
    local ws_name="$1"
    local target_output="$2"
    swaymsg workspace --no-auto-back-and-forth "$ws_name" 2>/dev/null || true
    swaymsg move workspace to output "$target_output"
}

export -f move_ws
export LEFT_OUT RIGHT_OUT

# Right-monitor workspaces → real left monitor
swaymsg -t get_workspaces -r | \
    jq -r --arg o "$RIGHT_OUT" '.[] | select(.output == $o) | .name' | \
    xargs -I {} bash -c 'move_ws "{}" "'"$LEFT_OUT"'"'

# Left-monitor workspaces → real right monitor
swaymsg -t get_workspaces -r | \
    jq -r --arg o "$LEFT_OUT" '.[] | select(.output == $o) | .name' | \
    xargs -I {} bash -c 'move_ws "{}" "'"$RIGHT_OUT"'"'

# Focus primary
swaymsg focus output "$LEFT_OUT"

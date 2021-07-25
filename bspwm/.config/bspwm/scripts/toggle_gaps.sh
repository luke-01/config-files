#! /bin/sh

gap_size=12

current_gap=$(bspc config window_gap)

if [ "$current_gap" -eq 0 ]; then
    bspc config window_gap $gap_size
    bspc config border_width 2
else
    bspc config window_gap 0
    bspc config border_width 0
fi

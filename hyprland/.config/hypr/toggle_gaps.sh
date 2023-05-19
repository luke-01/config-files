#!/bin/sh

current_gaps=$(hyprctl getoption general:gaps_in | sed -n '2p' | awk '{print $2}')

if [ "$current_gaps" != "0" ]; then
	hyprctl keyword general:gaps_in 0
	hyprctl keyword general:gaps_out 0
else
	hyprctl keyword general:gaps_in 5
	hyprctl keyword general:gaps_out 10
fi


#! /bin/sh

id=$(xdotool search --classname Scratchpad)

if [ "$id" != "" ]
    then
        bspc node "$id" --flag hidden -f
fi

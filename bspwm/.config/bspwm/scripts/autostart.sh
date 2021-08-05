#! /bin/sh

# keymap
setxkbmap latam -option 'ctrl:swapcaps'

# cursor
xsetroot -cursor_name left_ptr

# compositor and wallpaper

pgrep -x picom > /dev/null || picom &
nitrogen --restore &

# launch (or restart) polybar

killall -q polybar
echo "---" | tee -a /tmp/polybar.log
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
echo "bars launched..."

# launch (or restart) sxhkd

killall -q sxhkd
sxhkd &

# other stuff

pgrep -x nm-applet > /dev/null || nm-applet &
pgrep -x dunst > /dev/null || dunst &
pgrep -x lxsession > /dev/null || lxsession &
pcmanfm -d &

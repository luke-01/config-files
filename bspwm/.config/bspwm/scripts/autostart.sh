#! /bin/sh

# keymap
setxkbmap latam -option 'ctrl:swapcaps'

# cursor
xsetroot -cursor_name left_ptr

# compositor and wallpaper

pgrep -x picom > /dev/null || picom --experimental-backends --backend glx --blur-method gaussian &
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
pgrep -x pcmanfm > /dev/null || pcmanfm -d &

pgrep -x discord > /dev/null | discord --start-minimized &
pgrep -x steam > /dev/null | steam -silent &

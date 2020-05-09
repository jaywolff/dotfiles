#! /bin/env bash

# A basic script for toggling on and off i3-gaps

# simply add this line to your i3-config file to use
# bindsym $mod+g exec bash ~/dotfiles/scripts/i3_gaps.sh

tmp_file="/tmp/.i3-gaps"

if [ ! -e "$tmp_file" ]; then
    touch $tmp_file
    i3-msg gaps inner all set 0
    i3-msg gaps outer all set 0
    pkill picom

else
    rm $tmp_file
    pkill picom
    picom --daemon --config ~/dotfiles/.config/picom.conf
    i3-msg gaps inner all set 20
    i3-msg gaps outer all set 20
fi

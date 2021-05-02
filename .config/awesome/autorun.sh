#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run setxkbmap -option ctrl:nocaps &&
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &&
run picom &&
run dunst
# run blugon

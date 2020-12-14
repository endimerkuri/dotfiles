#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run nm-applet &&
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &&
run picom

#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run setxkbmap -option ctrl:nocaps -option compose:menu -option lv3:ralt_alt -variant colemak
run lxsession
run picom
run nitrogen --restore
run volctl

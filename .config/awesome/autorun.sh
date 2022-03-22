#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run setxkbmap -option ctrl:nocaps
run lxsession
run picom
run nitrogen --restore
run volctl

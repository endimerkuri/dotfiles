#!/bin/sh

black="#1d2021"
red="#cc241d"
green="#98971a"
yellow="#d79921"
blue="#458588"
magenta="#b16286"
cyan="#689d6a"
white="#a89984"
blacktext="^c$black^"

out=$(acpi)
charging=$(echo "$out" | awk -F ' ' '{print $3}')
level=$(echo "$out" | awk -F ', ' '{print $2, $3}')
icon=$([ "$charging" = "Charging," ] && echo " " || echo " ")
echo "$blacktext^b$cyan^ $icon$level ^d^"

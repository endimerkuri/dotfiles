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

out=$(date '+%b %d (%a) %H:%M')
echo "$blacktext^b$white^ $out ^d^"

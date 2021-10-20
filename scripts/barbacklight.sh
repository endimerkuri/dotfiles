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

out=$(xbacklight -get)

case $BUTTON in
    4)
        xbacklight -inc 5;
        msgId="991049"
        dunstify -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${out%.*}"
        ;;
    5)
        xbacklight -dec 5;
        msgId="991049"
        dunstify -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${out%.*}"
        ;;
esac

echo "$blacktext^c$yellow^   ${out%.*}% ^d^"

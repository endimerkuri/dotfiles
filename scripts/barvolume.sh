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

out=$(amixer sget Master)
mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
icon=$([ "$mute" = "off" ] && echo "  " || echo "  ")

case $BUTTON in
    1)
        amixer sset Master toggle;
        msg=$([ "$mute" = "off" ] &&  echo "  Audio Unmuted" || echo "  Audio Muted" )
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$msg"
        ;;
    5)
        amixer sset Master 5%+;
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$icon Volume: ${level}"
        ;;
    4)
        amixer sset Master 5%-;
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$icon Volume: ${level}"
        ;;
esac

echo "$blacktext^b$red^ $icon$level ^d^"

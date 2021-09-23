#!/bin/sh

case $1 in
    0)
        xbacklight -inc 5; pkill -RTMIN+2 dwmblocks
        level=$(xbacklight -get | cut -d'.' -f 1)
        msgId="991049"
        dunstify -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${level}"
        ;;
    1)
        xbacklight -dec 5; pkill -RTMIN+2 dwmblocks
        level=$(xbacklight -get | cut -d'.' -f 1)
        msgId="991049"
        dunstify -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${level}"
        ;;
    2)
        amixer sset Master 5%+; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo " " || echo " ")
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$icon Volume: ${level}"
        ;;
    3)
        amixer sset Master 5%-; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo " " || echo " ")
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$icon Volume: ${level}"
        ;;
    4)
        amixer sset Master toggle; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        msg=$([ "$mute" = "off" ] && echo "  Audio Muted" || echo "  Audio Unmuted")
        msgId="991049"
        dunstify -a "changeVolume" -i none -t 1000 -u low -r "$msgId" "$msg"
        ;;
    5)
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo "  " || echo "  ")
        echo "$icon$level"
        ;;
    6)
        out=$(acpi)
        charging=$(echo "$out" | awk -F ' ' '{print $3}')
        level=$(echo "$out" | awk -F ', ' '{print $2, $3}')
        icon=$([ "$charging" = "Charging," ] && echo " " || echo " ")
        echo "$icon$level"
        ;;
    7)
        out=$(xbacklight -get)
        echo "  ${out%.*}%"
        ;;
esac

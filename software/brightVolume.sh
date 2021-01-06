#!/bin/dash

case $1 in
    0)
        xbacklight -inc 5; pkill -RTMIN+2 dwmblocks
        ;;
    1)
        xbacklight -dec 5; pkill -RTMIN+2 dwmblocks
        ;;
    2)
        amixer sset Master 5%+; pkill -RTMIN+1 dwmblocks
        ;;
    3)
        amixer sset Master 5%-; pkill -RTMIN+1 dwmblocks
        ;;
    4)
        amixer sset Master toggle; pkill -RTMIN+1 dwmblocks
        ;;
    5)
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo "ﱝ " || echo " ")
        echo "$icon$level"
        ;;
    6)
        out=$(acpi)
        charging=$(echo "$out" | awk -F ' ' '{print $3}')
        level=$(echo "$out" | awk -F ', ' '{print $2}')
        icon=$([ "$charging" = "Charging," ] && echo " " || echo " ")
        echo "$icon$level"
        ;;
    7)
        out=$(xbacklight -get)
        echo "${out%.*}"
        ;;
esac

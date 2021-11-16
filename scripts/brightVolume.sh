#!/bin/sh

case $1 in
    0)
        xbacklight -inc 5; pkill -RTMIN+2 dwmblocks
        level=$(xbacklight -get | cut -d'.' -f 1)
        icon="brightnesssettings"
        msgId="991049"
        dunstify -h int:value:$level -a "changeBrightness" -i $icon -t 1000 -u low -r "$msgId" "Brightness: $level"
        ;;
    1)
        xbacklight -dec 5; pkill -RTMIN+2 dwmblocks
        level=$(xbacklight -get | cut -d'.' -f 1)
        icon="brightnesssettings"
        msgId="991049"
        dunstify -h int:value:$level -a "changeBrightness" -i $icon -t 1000 -u low -r "$msgId" "Brightness: $level"
        ;;
    2)
        amixer sset Master 5%+; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo "audio-volume-muted" || echo "audio-volume-high")
        msgId="991049"
        dunstify -h int:value:"$level" -a "changeVolume" -i $icon -t 1000 -u low -r "$msgId" "Volume: $level"
        ;;
    3)
        amixer sset Master 5%-; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        level=$(echo "$out" | awk -F"[][]" '/Left:/ {print $2}')
        icon=$([ "$mute" = "off" ] && echo "audio-volume-muted" || echo "audio-volume-high")
        msgId="991049"
        dunstify -h int:value:"$level" -a "changeVolume" -i $icon -t 1000 -u low -r "$msgId" "Volume: $level"
        ;;
    4)
        amixer sset Master toggle; pkill -RTMIN+1 dwmblocks
        out=$(amixer sget Master)
        mute=$(echo "$out" | awk -F"[][]" '/Left:/ {print $4}')
        msg=$([ "$mute" = "off" ] && echo "Audio Muted" || echo "Audio Unmuted")
        icon=$([ "$mute" = "off" ] && echo "audio-volume-muted" || echo "audio-volume-high")
        msgId="991049"
        dunstify -a "changeVolume" -i $icon -t 1000 -u low -r "$msgId" "$msg"
        ;;
esac

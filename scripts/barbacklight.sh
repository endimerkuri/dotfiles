#!/bin/sh

out=$(xbacklight -get)

case $BUTTON in
    5)
        xbacklight -inc 5;
        msgId="991049"
        dunstify -h int:value:$out -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${out%.*}%"
        ;;
    4)
        xbacklight -dec 5;
        msgId="991049"
        dunstify -h int:value:$out -a "changeBrightness" -i none -t 1000 -u low -r "$msgId" "  Brightness: ${out%.*}%"
        ;;
esac

echo "  ${out%.*}% "

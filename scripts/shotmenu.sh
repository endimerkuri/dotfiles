#!/bin/sh

res=$(echo "full\nregion\nwindow\ncancel" | dmenu -p "Screenshot")
filename=~/Pictures/screenshot-$(date +%F-%M-%S).png
command="maim -d 1 -u $filename"
sendNot="notify-send -t 1000 \"Screenshot!!!\""

case $res in
    full)
        $command
        $sendNot
        ;;
    region)
        $command -s
        $sendNot
        ;;
    window)
        id=$(xdotool selectwindow)
        $command -i $id
        $sendNot
        ;;
    *)
        ;;
esac

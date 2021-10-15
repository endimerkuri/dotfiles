#!/bin/sh

res=$(echo "full\nregion\nwindow\ncancel" | dmenu -p "Screenshot")
filename=~/Pictures/screenshot-$(date +%F-%M-%S).png
command="maim -d 1 -u $filename"

case $res in
    full)
        $command
        ;;
    region)
        $command -s
        ;;
    window)
        id=$(xdotool selectwindow)
        $command -i $id
        ;;
    *)
        ;;
esac

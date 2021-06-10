#!/bin/sh

res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | rofi -dmenu -l 5 -p "Logout")

case $res in
    lock)
        i3lock -c 000000
        ;;
    logout)
        # dwmc quit
        openbox --exit
        ;;
    shutdown)
        systemctl poweroff 
        ;;
    reboot)
        systemctl reboot
        ;;
    *)
        ;;
esac

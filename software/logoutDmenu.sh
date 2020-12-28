#!/bin/bash

res=$(echo -e "lock\nlogout\nshutdown\nreboot\ncancel" | dmenu -l 5 -p "Logout")

case $res in
    lock)
        slock
        ;;
    logout)
        dwmc quit
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

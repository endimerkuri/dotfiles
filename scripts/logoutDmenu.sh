#!/bin/sh

res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | dmenu -p "Logout")

case $res in
    lock)
        slock
        ;;
    logout)
        dwmc quit
        awesome-client 'return awesome.quit()'
        # i3-msg exit
        # openbox --exit
        # qtile cmd-obj -o cmd -f shutdown
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

#!/bin/sh

# res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | rofi -dmenu -location 1 -yoffset 19 -l 5 -p "Logout")
res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | dmenu -p "Logout")

case $res in
    lock)
        slock
        ;;
    logout)
        dwmc quit
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

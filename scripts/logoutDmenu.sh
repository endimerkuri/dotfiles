#!/bin/sh

# res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | rofi -dmenu -location 1 -yoffset 19 -l 5 -p "Logout")
res=$(echo "lock\nlogout\nshutdown\nreboot\ncancel" | dmenu -p "Logout" -b -z 200 -y 24 -g 1 -x 0)

case $res in
    lock)
        slock
        ;;
    logout)
        # dwmc quit
        i3-msg exit
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

#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="襤"
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
dir="$HOME/.config/rofi/power"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        systemctl poweroff
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $reboot)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        systemctl reboot
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $lock)
        betterlockscreen -l dimblur
        ;;
    $suspend)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        systemctl suspend
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $logout)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
		bspc quit
		xdotool key super+Escape
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
esac

#!/bin/sh
out=$(acpi)
charging=$(echo "$out" | awk -F ' ' '{print $3}')
level=$(echo "$out" | awk -F ', ' '{print $2, $3}')
icon=$([ "$charging" = "Charging," ] && echo " " || echo " ")
low="20"
levelNumber=${level%\%*}
echo " $icon$level"

if [ "$levelNumber" -lt "$low" ]; then
    notify-send -i battery -u critical "Battery very low!!!"
fi

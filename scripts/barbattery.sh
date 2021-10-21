#!/bin/sh
out=$(acpi)
charging=$(echo "$out" | awk -F ' ' '{print $3}')
level=$(echo "$out" | awk -F ', ' '{print $2, $3}')
icon=$([ "$charging" = "Charging," ] && echo " " || echo " ")
echo " $icon$level "

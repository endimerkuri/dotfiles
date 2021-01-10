#!/bin/sh
cat /home/endi/emoji | dmenu -l 20 | cut -d' ' -f 1 | xclip -r -selection clipboard

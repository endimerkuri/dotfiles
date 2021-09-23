#!/bin/sh
cat ~/.local/share/emoji | dmenu -l 20 | cut -d' ' -f 1 | xclip -r -selection clipboard

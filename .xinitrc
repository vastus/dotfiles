#!/bin/sh

# wmname LG3D &

# firefox &
# thunderbird &

setxkbmap -option terminate:ctrl_alt_bksp &

[[ -r ~/.Xresource ]] && xrdb -merge ~/.Xresources &

[[ -r ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &

# bind ctrl to caps lock
setxkbmap -option ctrl:nocaps &

# xinput set-button-map 11 1 2 3 5 4 7 8 9 10 11 12 13 &

exec ssh-agent ~/.local/bin/startdwm

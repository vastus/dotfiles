#!bin/sh

xrdb -merge ~/.Xresources &
setxkbmap -option terminate:ctrl_alt_bksp &
wmname LG3D &

# startup programs
firefox &
thunderbird &

# source .Xmodmap if present
if [ -s ~/.Xmodmap ]; then
  # for apple keyboard
  xmodmap ~/.Xmodmap &
fi

# make caps lock behave like control
setxkbmap -option ctrl:nocaps &

xinput set-button-map 11 1 2 3 5 4 7 8 9 10 11 12 13 &

# start dwm
exec startdwm

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

# start dwm
exec startdwm

#!bin/sh

xrdb -merge ~/.Xresources &
setxkbmap -option terminate:ctrl_alt_bksp &
wmname LG3D &

# startup programs
firefox &
thunderbird &

# start dwm
exec startdwm

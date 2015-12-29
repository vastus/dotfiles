#!bin/sh

xrdb -merge ~/.Xresources &
setxkbmap -option terminate:ctrl_alt_bksp &
wmname LG3D &

# start dwm
exec startdwm

#!bin/sh
xrdb -merge ~/.Xresources &
setxkbmap -option terminate:ctrl_alt_bksp &

exec startdwm

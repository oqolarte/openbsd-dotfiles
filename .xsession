#!/bin/sh -e

# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.kshrc

# hide X11 pointer (cursor) when it has not moved for a few seconds
unclutter -root -idle 2 -noevents &

# "natural" scroll for trackpad
xinput set-button-map	/dev/wsmouse0	1 2 3 5 4 7 6

# keep regular scroll and slowdown mouse, trackpoint, and trackball
xinput set-button-map	/dev/wsmouse	1 2 3 4 5 6 7

# emulate the middle button and the scroll wheel
xinput set-prop /dev/wsmouse 'Device Accel Constant Deceleration' 2
xinput set-prop /dev/wsmouse 'WS Pointer Middle Button Emulation' 1
xinput set-prop /dev/wsmouse 'WS Pointer Wheel Emulation'         1
xinput set-prop /dev/wsmouse 'WS Pointer Wheel Emulation Button'  2
xinput set-prop /dev/wsmouse 'WS Pointer Wheel Emulation Inertia' 2
xinput set-prop /dev/wsmouse 'WS Pointer Wheel Emulation Axes' 6 7 4 5 
xinput set-prop /dev/wsmouse 'WS Pointer Wheel Emulation Timeout' 250

# increase pointer speed
xinput set-prop /dev/wsmouse 'Device Accel Constant Deceleration' 0.4

# disable system beep
xset -b off

# start dwm and slstatus
/usr/local/bin/dwm
/usr/local/bin/slstatus

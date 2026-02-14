#!/bin/sh

export XDG_CURRENT_DESKTOP=GNOME
export XDG_SESSION_DESKTOP=GNOME
export XDG_SESSION_TYPE=x11
export XAUTHORITY="$HOME/.Xauthority"

systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

exec i3

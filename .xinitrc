#!/bin/sh

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=i3
export XDG_SESSION_DESKTOP=i3
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

systemctl --user import-environment \
    DISPLAY XAUTHORITY \
    XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

dbus-update-activation-environment --systemd \
    DISPLAY XAUTHORITY \
    XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

systemctl --user reset-failed
systemctl --user start i3-session.target

i3

systemctl --user stop i3-session.target

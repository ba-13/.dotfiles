#!/bin/bash

# File to store the log
log_file="focus_log.txt"

# Clear the log file or create it if it doesn't exist
> "$log_file"

while true; do
    # Get the active window's ID
    active_window_id=$(xdotool getactivewindow)

    # Get the window class of the active window
    window_class=$(xprop -id "$active_window_id" | grep WM_CLASS | awk '{print $4}')

    # Get the active window's name
    active_window_name=$(xdotool getactivewindow getwindowname)

    # Check if the active window is Firefox
    if [ "$window_class" == '"firefox"' ]; then
        # Get the title of the active tab
        active_tab_title=$(xdotool search --onlyvisible --name "Mozilla Firefox" getwindowname)
        echo "$(date): Focused on Firefox - Tab: $active_tab_title" >> "$log_file"
    else
        echo "$(date): Focused on $active_window_name" >> "$log_file"
    fi

    # Sleep for a while (adjust the interval as needed)
    sleep 1
done


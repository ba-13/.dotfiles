#!/bin/bash

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d " " -f1)
SECONDARY=$(xrandr --query | grep " connected" | grep -v "primary" | head -n 1 | cut -d " " -f1)

if [ -z "$SECONDARY" ]; then
    SECONDARY=$PRIMARY
fi

echo "set \$pm $PRIMARY"
echo "set \$set $SECONDARY"

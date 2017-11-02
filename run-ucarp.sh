#!/bin/sh

if [ -z "$UCARP_VID" ] || [ -z "$UCARP_DEVICE" ] || [ -z "$UCARP_ADDRESS" ] || [ -z "$UCARP_PASSWORD" ]; then
    echo "You must provide UCARP_VID, UCARP_DEVICE, UCARP_ADDRESS, and UCARP_PASSWORD environment variables";
    exit 255;
fi;

UCARP_IP=$(echo $UCARP_ADDRESS | sed 's/\/.*//')
UCARP_LOCAL_ADDRESS=$(ip addr show $UCARP_DEVICE | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | grep -o [0-9].*)

/usr/sbin/ucarp -v $UCARP_VID -p $UCARP_PASSWORD -a $UCARP_IP -s $UCARP_LOCAL_ADDRESS -i $UCARP_DEVICE --upscript=/etc/ucarp/vip-up.sh --downscript=/etc/ucarp/vip-down.sh

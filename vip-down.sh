#! /bin/sh

UCARP_ADDRESS=${UCARP_ADDRESS}
UCARP_DEVICE=${UCARP_DEVICE}

if [ -z "$UCARP_ADDRESS" ]; then
	echo "No UCARP_ADDRESS provided";
	exit 255;
fi;

if [ -z "$UCARP_DEVICE" ]; then
        echo "No UCARP_DEVICE provided";
        exit 255;
fi;

/sbin/ip addr del $UCARP_ADDRESS dev $UCARP_DEVICE;

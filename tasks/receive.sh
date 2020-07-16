#!/bin/sh

if [ -x /usr/bin/wormhole ]; then
	WORMHOLE=/usr/bin/wormhole
elif [ -x /usr/local/bin/wormhole ]; then
	WORMHOLE=/usr/local/bin/wormhole
else
	echo "wormhole not found" >&2
	exit 1
fi

$WORMHOLE receive --accept-file --output-file "${PT_filename}" --hide-progress "${PT_code}"
